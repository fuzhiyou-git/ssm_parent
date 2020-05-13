import com.itheima.util.EmailUtil;
import com.itheima.util.MsgUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-rabbit-produce.xml")
public class T {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Test
    public void t_() {
        Map<String, String> map = MsgUtil.map("chiyu96@sina.com", "hfhfhf");
        rabbitTemplate.convertAndSend("myExchange", "msg.email", map);
        //System.out.println ("好烦好烦的");

    }

    @Test
    public void t1_() {
      //  EmailUtil.sendHtmlMail("chiyu96@sina.com","符致友","好烦好烦的");
        System.out.println ("好烦好f方如飞复合肥烦的");

    }
}
