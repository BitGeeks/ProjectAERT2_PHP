import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { TranslatePipe } from '@ngx-translate/core';

@Component({
  selector: 'app-privacy',
  templateUrl: './privacy.component.html',
  styleUrls: ['./privacy.component.scss']
})
export class PrivacyComponent implements OnInit {

  constructor(
    private title: Title,
    private translatePipe: TranslatePipe
  ) { }

  ngOnInit(): void {
    this.title.setTitle(this.translatePipe.transform('Chính sách bảo mật'));
  }

}
