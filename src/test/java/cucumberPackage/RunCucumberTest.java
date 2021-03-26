package cucumberPackage;

import cucumber.api.CucumberOptions;
import io.cucumber.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        format = {"json:target/cucumber.json"},
        features = {"src/test/resources/features/sample.feature"},
        glue = {"cucumberPackage"},
        strict = true
)
public class RunCucumberTest {

}
