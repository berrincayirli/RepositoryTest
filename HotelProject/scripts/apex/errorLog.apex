try{
    Contact newcont = new contact();
    newcont.FirstName = 'Hilal';
    insert newcont;
}catch(Exception exc){
    System.debug('EXC' + exc.getMessage());
    ErrorlogHandler.CreateErrorlog('contact', 'newcontact');
}