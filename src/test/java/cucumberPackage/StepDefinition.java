package cucumberPackage;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class StepDefinition {
    @Given("sample feature file is ready")
    public void givenStatement() {
        System.out.println("Given OK!");
    }

    @When("I run the feature file")
    public void whenStatement() {
        System.out.println("When OK!");
    }

    @Then("run should be successful")
    public void thenStatement() {
        System.out.println("Then OK!");
    }
}
