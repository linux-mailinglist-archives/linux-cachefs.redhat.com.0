Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB93532F4B
	for <lists+linux-cachefs@lfdr.de>; Tue, 24 May 2022 18:56:27 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-lAmWIrqZMbiXxqL6fZ8jcQ-1; Tue, 24 May 2022 12:56:10 -0400
X-MC-Unique: lAmWIrqZMbiXxqL6fZ8jcQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4E95800B21;
	Tue, 24 May 2022 16:56:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16E682026D07;
	Tue, 24 May 2022 16:56:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BBA12193220C;
	Tue, 24 May 2022 16:56:08 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A3BC81947040 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 21 May 2022 14:49:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7CF187ADD; Sat, 21 May 2022 14:49:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78D127774
 for <linux-cachefs@redhat.com>; Sat, 21 May 2022 14:49:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EA9685A5AA
 for <linux-cachefs@redhat.com>; Sat, 21 May 2022 14:49:07 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-wwW0fpDSP0KmXOL6iGGxIw-1; Sat, 21 May 2022 10:49:05 -0400
X-MC-Unique: wwW0fpDSP0KmXOL6iGGxIw-1
Received: by mail-pj1-f51.google.com with SMTP id
 z7-20020a17090abd8700b001df78c7c209so13792792pjr.1; 
 Sat, 21 May 2022 07:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEDSE1m+N2pYJdPG78Lh5a6q6esXpeyoa6uPZvrclFc=;
 b=PahBZdsRn62rU6IGQB9PSzlqwqmd/1WfChT1M3VR+tYAl7c7+vjdeD9f3O6yBBgLbU
 //wwz6lOpNzNGUjI7dlPlVJGHrFBlLNSaY7HWnX/0Vd0w93c2uvLwqBS5ZHZyoGvmTxA
 Df/jdVWsT77H3Jlp3qZttUn2kSdhCXsDjNlQoCTtVZlSoEtz62nVmkbnfSxph/v7apak
 zY3hOzPTTPXyoDFtg85EHztrjAxSbRnu3Ny7oMxV+L+YU3CnL0ttu7iEshkw1ZdYgrKp
 W7D+2bKywC39f69+ZxKNLSDGXS3wEvfs5R+VTB/ZHCxVnG4h8t6KQGc22Pfc/VoQbtLZ
 il9A==
X-Gm-Message-State: AOAM530eV/L4kALWpCMKMufhvqwwYPhFJ0iO55d29OmDmL11tyml8iGk
 HhaJIPW/EidhxkOQ8Fb/sGI=
X-Google-Smtp-Source: ABdhPJweIG1odMEjxkG19mhDsemgTmxJXjxh0vDN9QHxD5/5kjm6SG9klmp/njsu9QE2v3z4H44UXg==
X-Received: by 2002:a17:90a:a384:b0:1dc:a407:b5ac with SMTP id
 x4-20020a17090aa38400b001dca407b5acmr16585135pjp.11.1653144544094; 
 Sat, 21 May 2022 07:49:04 -0700 (PDT)
Received: from localhost.localdomain ([103.230.104.50])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a17090a290800b001dc4d22c0a7sm3709572pjd.10.2022.05.21.07.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 07:49:03 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Date: Sat, 21 May 2022 20:24:46 +0600
Message-Id: <20220521142446.4746-1-khalid.masum.92@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mailman-Approved-At: Tue, 24 May 2022 16:56:07 +0000
Subject: [Linux-cachefs] [PATCH] fscache: fix misdocumented parameter name
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Khalid Masum <khalid.masum.92@gmail.com>, linux-cachefs@redhat.com,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To fix warning generated by make docs in the file fscache.h:
The functions fscache_use_cookie and fscache_unuse_cookie have a
parameter named cookie. But they are documented with the name "object".
Which generates warning when creating docs. This commit will replace
the documentation with a better one named "cookie". This new
documentation
line is taken from the function fscache_update_cookie in the same
file.

Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
 include/linux/fscache.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index e25539072..32cf593b8 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -256,7 +256,7 @@ struct fscache_cookie *fscache_acquire_cookie(struct fscache_volume *volume,
 
 /**
  * fscache_use_cookie - Request usage of cookie attached to an object
- * @object: Object description
+ * @cookie: The cookie representing the cache object
  * @will_modify: If cache is expected to be modified locally
  *
  * Request usage of the cookie attached to an object.  The caller should tell
@@ -272,7 +272,7 @@ static inline void fscache_use_cookie(struct fscache_cookie *cookie,
 
 /**
  * fscache_unuse_cookie - Cease usage of cookie attached to an object
- * @object: Object description
+ * @cookie: The cookie representing the cache object
  * @aux_data: Updated auxiliary data (or NULL)
  * @object_size: Revised size of the object (or NULL)
  *
-- 
2.25.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

