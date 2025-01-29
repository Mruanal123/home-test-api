package Inventory;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit5.Karate;

@KarateOptions(tags = {"@Regression,E2E"} )
public class TestRunner {

    @Karate.Test
    Karate Booking_Features() {
        new Karate();
         return Karate.run(
                "classpath:Inventory/Flows/InventoryCreation.feature",
                 "classpath:Inventory/Flows/VerifyRecentInventoryCreated.feature",
                "classpath:Inventory/Flows/InventoryCreationWithInvalidFields.feature",
                "classpath:Inventory/Flows/FetchInventoryList.feature",
               "classpath:Inventory/Flows/FetchItemInventory.feature");

    }
}