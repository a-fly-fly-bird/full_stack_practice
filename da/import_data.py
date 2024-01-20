import requests
from datetime import date, datetime, timedelta
import time
import json
from enum import Enum
import pymysql


class AssetsType(Enum):
    STOCK = 'stock'
    FUND = 'fund'
    BOND = 'bond'


class Tools:
    @staticmethod
    def time2stamp(date: date):
        return date.strftime("%s")

    @staticmethod
    def readLocalJson():
        with open('data.json', 'r') as file:
            str = file.read()
            data = json.loads(str)
            return data


'''
Get Data Core Class
'''


class FinancialDataScrapy():
    baseURL = 'https://query2.finance.yahoo.com/v8/finance/chart/{0}'

    headers = {
        'User-Agent': 'Mozilla/5.0 (MacBook Air; M1 Mac OS X 11_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/604.1',
        'X-Requested-With': 'XMLHttpRequest',
    }
    params = {
        'formatted': True,
        'crumb': 'yL7ZfYJ7dZS',
        'lang': 'en-US',
        'region': 'US',
        'includeAdjustedClose': True,
        'interval': '1d',
        'period1': None,
        'period2': None,
        'events': 'capitalGain%7Cdiv%7Csplit',
        'useYfid': True,
        'corsDomain': 'finance.yahoo.com'
    }

    def __init__(self, baseURL: str = None, headers=None, params=None):
        if baseURL:
            self.baseURL = baseURL
        if headers:
            self.headers = headers
        if params:
            self.params = params

    def getStockData(self, code: str, startDate: date = date.today() - timedelta(days=365), endDate: date = date.today()):
        print('stock code\'s data type is ', AssetsType.STOCK)
        return self.getDataHelper(code, startDate, endDate)

    def getFundData(self, code: str, startDate: date = date.today() - timedelta(days=365), endDate: date = date.today()):
        print('stock code\'s data type is ', AssetsType.FUND)
        return self.getDataHelper(code, startDate, endDate)

    def getBondData(self, code: str, startDate: date = date.today() - timedelta(days=365), endDate: date = date.today()):
        print('stock code\'s data type is ', AssetsType.BOND)
        return self.getDataHelper(code, startDate, endDate)

    def getDataHelper(self,  code: str, startDate: date, endDate: date):
        realURL = self.baseURL.format(code)
        self.params['period1'] = Tools.time2stamp(startDate)
        self.params['period2'] = Tools.time2stamp(endDate)
        try:
            print('real url is ', realURL)
            print('param is ', self.params)
            response = requests.get(
                realURL, headers=self.headers, params=self.params)
            print('response.status_code is:', response.status_code)
            if response.status_code == 200:
                return response.json()
        except requests.ConnectionError as e:
            print('Error', e.args)
            return None


class DatabaseConnector:
    dbms = None
    cursor = None
    create_table_sql = '''
    CREATE TABLE IF NOT EXISTS %s (
        `%s_id` int NOT NULL AUTO_INCREMENT,
        `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
        `code` varchar(50) COLLATE utf8mb4_bin NOT NULL,
        `date` datetime NOT NULL,
        `open` double(12,6) DEFAULT NULL,
        `high` double(12,6) DEFAULT NULL,
        `low` double(12,6) DEFAULT NULL,
        `close` double(12,6) DEFAULT NULL,
        `adj_close` double(12,6) DEFAULT NULL,
        `volume` int DEFAULT NULL,
    PRIMARY KEY (`%s_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
    '''
    insert_sql = '''
    INSERT INTO %s(name, code, date, open, high, low, close, adj_close, volume) values('% s', '% s', '% s', % s, % s, % s, % s, % s, % s)
    '''

    def __init__(self, host='127.0.0.1', user='root', password='123456', port=3306, database='fims'):
        self.connect(host, user, password, port, database)

    def connect(self, host='127.0.0.1', user='root', password='123456', port=3306, database='fims'):
        if (self.cursor):
            self.cursor.close()
        if (self.dbms):
            self.dbms.close()

        # connect
        self.dbms = pymysql.connect(
            host=host, user=user, password=password, port=port, db=database)
        self.cursor = self.dbms.cursor()
        self.cursor.execute('SELECT VERSION()')
        data = self.cursor.fetchone()
        print('Database version:', data)
        ddl = f"CREATE DATABASE IF NOT EXISTS {database} DEFAULT CHARACTER SET utf8mb4"
        self.cursor.execute(ddl)
        self.check()

    def check(self):
        # check table
        for type in AssetsType:
            # self.cursor.execute('SET FOREIGN_KEY_CHECKS=0;')
            # self.cursor.execute('DROP TABLE IF EXISTS stock;')
            # self.cursor.execute('DROP TABLE IF EXISTS fund;')
            # self.cursor.execute('DROP TABLE IF EXISTS bond;')
            # self.cursor.execute('SET FOREIGN_KEY_CHECKS=1;')
            self.cursor.execute(self.create_table_sql %
                                (type.value, type.value, type.value))

    def store(self, data, code, type: AssetsType):
        data = data['chart']['result'][0]
        timestamps = data['timestamp'] 
        name = data['meta']['symbol']
        for index, timestamp in enumerate(timestamps):
            date = datetime.fromtimestamp(timestamp)
            high = data['indicators']['quote'][0]['high'][index]
            close = data['indicators']['quote'][0]['close'][index]
            volume = data['indicators']['quote'][0]['volume'][index]
            open = data['indicators']['quote'][0]['open'][index]
            low = data['indicators']['quote'][0]['low'][index]
            adjclose = data['indicators']['adjclose'][0]['adjclose'][index]
            # print(index_timestamp, high, close, volume, open, low, adjclose)
            try:
                sql_going_to_run = self.insert_sql % (
                    type.value, name, code, date, open, high, low, close, adjclose, volume)
                print(sql_going_to_run)
                self.cursor.execute(sql_going_to_run.replace("None", "NULL"))
                self.dbms.commit()
            except pymysql.Error as e:
                # 处理插入异常
                print("插入数据时发生异常：", e)
                self.dbms.rollback()
            finally:
                self.dbms.commit()

class Operator:
    def __init__(self) -> None:
        pass
    
    @staticmethod
    def downloadFile():
        stock_code = 'AAPL'
        financialDataScrapy = FinancialDataScrapy()
        startDate: date = date.today() - timedelta(days=365)
        endDate: date = date.today()
        aapl_data = financialDataScrapy.getStockData(stock_code)
        print(aapl_data)
        filename = stock_code + '_from_' + \
            startDate.strftime('%m-%d-%Y') + '_to_' + \
            endDate.strftime('%m-%d-%Y') + '_data.json'
        print('store data in ./', filename)
        with open(filename, 'w', encoding='utf-8') as file:
            file.write(json.dumps(aapl_data, indent=2, ensure_ascii=False))

    def downloadAndUpload():
        financialDataScrapy = FinancialDataScrapy()
        databaseConnector = DatabaseConnector()
        stock_list = ['AMD', 'MARA', 'TSLA', 'TCN', 'NIO', 'AAPL', 'F', 'T', 'NVDA', 'LCID', 'INTC', 'BBD', 'VALE', 'AMZN', 'SOFI', 'PLTR', 'AAL', 'JD']
        fund_list = ['FTXL', 'BLCN', 'SOXX', 'QLD', 'PSI', 'SMH', 'XSD', 'PTF', 'IGM',
                    'FLTW', 'EWT', 'IYW', 'FIVG', 'XLK', 'IXN', 'FXO', 'VGT', 'QQQ', 'FXL']
        bond_list = ['^IRX', '^FVX', '^TNX', '^TYX',
                    '^GSPC', '^DJI', '^IXIC', '^TNX', '^RUT', '^VIX']

        start_time = datetime.now()
        print('start time is ', start_time)
        for stock_code in stock_list:
            stock_json_data = financialDataScrapy.getFundData(stock_code)
            databaseConnector.store(stock_json_data, stock_code, AssetsType.STOCK)
            time.sleep(0.5)
        for fund_code in fund_list:
            fund_json_data = financialDataScrapy.getFundData(fund_code)
            databaseConnector.store(fund_json_data, fund_code, AssetsType.FUND)
            time.sleep(0.5)
        for bond_code in bond_list:
            bond_json_data = financialDataScrapy.getBondData(bond_code)
            databaseConnector.store(bond_json_data, bond_code, AssetsType.BOND)
            time.sleep(0.5)
        end_time = datetime.now()
        print('end time is ', end_time)
        print('耗时', end_time - start_time)

if __name__ == '__main__':
    # Operator.downloadFile()    
    Operator.downloadAndUpload()