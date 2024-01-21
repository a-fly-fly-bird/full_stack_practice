import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';

const routes: Routes = [
  {
    path: '',
    component: AppComponent,
    children: [
      {
        path: '',
        redirectTo: 'home',
        pathMatch: 'full'
      },
      {
        path: 'home',
        loadChildren: () => import('./main/homepage/homepage-routing.module').then(m => m.HomepageRoutingModule),
        pathMatch: 'full'
      },
    ]
  },
  {
    path: 'login',
    loadComponent: () => import('./main/login/login.component').then(mod => mod.LoginComponent),
    pathMatch: 'full'
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
