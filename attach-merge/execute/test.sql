# to get UID "LmMn4F/HQ0WBBfDVJnrUYQ==", query P_S, using P= m|title S= Maverick 
select concat("&atds.Edge{Puid: uuid.DecodeBase64(uuid.UIDb64(\"",to_base64(Puid),"\")) , Cuid: uuid.DecodeBase64(uuid.UIDb64(\"",substr(SortK_Cuid,10,26),"\")) , Sortk: \"",substr(SortK_Cuid,1,8),"\"},") 
from  EdgeChild_Movies where to_base64(Puid) = "LmMn4F/HQ0WBBfDVJnrUYQ==" ;       
