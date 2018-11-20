-- Trigger V9 inventory replication to Prism
-- By Zach Cutberth

declare
itemsid number(19);

begin
  
  for itemsid in (select item_sid from cms.invn_sbs where rownum <= 1000) loop
    
    update cms.invn_sbs set modified_Date = modified_date where item_sid = itemsid.item_sid;
    
    update cms.invn_sbs_price set price = price where item_sid = itemsid.item_sid;
    
  end loop;
  
  commit;
  
end;