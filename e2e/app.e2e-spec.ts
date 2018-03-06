import { Angular2App01Page } from './app.po';

describe('angular2-app01 App', () => {
  let page: Angular2App01Page;

  beforeEach(() => {
    page = new Angular2App01Page();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
