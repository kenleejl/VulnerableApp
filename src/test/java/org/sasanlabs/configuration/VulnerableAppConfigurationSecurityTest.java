package org.sasanlabs.configuration;

import static org.assertj.core.api.Assertions.assertThat;

import org.apache.commons.fileupload.FileUpload;
import org.junit.jupiter.api.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.multipart.support.MultipartFilter;

class VulnerableAppConfigurationSecurityTest {

    @Test
    void level9UploadIsBoundedBeforeTheMultipartBodyIsParsed() {
        MultipartFilter filter = new VulnerableAppConfiguration().multipartFilter();
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.setServletPath("/UnrestrictedFileUpload/LEVEL_9");

        MultipartResolver resolver =
                ReflectionTestUtils.invokeMethod(filter, "lookupMultipartResolver", request);

        assertThat(resolver).isInstanceOf(CommonsMultipartResolver.class);
        FileUpload fileUpload = ((CommonsMultipartResolver) resolver).getFileUpload();
        assertThat(fileUpload.getFileSizeMax()).isEqualTo(2L * 1024L * 1024L);
        assertThat(fileUpload.getSizeMax()).isEqualTo((2L * 1024L * 1024L) + (64L * 1024L));
    }
}
