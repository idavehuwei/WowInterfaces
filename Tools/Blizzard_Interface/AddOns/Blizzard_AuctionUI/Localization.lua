-- This file is executed at the end of addon load

-- Auction tabs
for i = 1, 3 do
    getglobal("AuctionFrameTab" .. i .. "Text"):SetPoint("CENTER", "AuctionFrameTab" .. i, "CENTER", 0, 5);
end

-- Auction Browse Headers
BrowseLevelText:SetPoint("BOTTOMLEFT", "AuctionFrameBrowse", "TOPLEFT", 230, -56);
BrowseBidText:SetPoint("BOTTOMRIGHT", "AuctionFrameBrowse", "BOTTOM", -75, 18);
BrowseMinLevel:SetPoint("TOPLEFT", "BrowseLevelText", "BOTTOMLEFT", 3, -3);
BrowseDropDown:SetPoint("TOPLEFT", "BrowseLevelText", "BOTTOMRIGHT", -5, 4);
BrowseDropDownName:SetPoint("BOTTOMLEFT", "BrowseDropDown", "TOPLEFT", 20, -3);

-- Bid Tab Headers
BidDurationSort:SetWidth(90);
BidBidSort:SetWidth(158);
