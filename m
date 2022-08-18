Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B48597CAB
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 06:08:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660795680;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kRgEfwLg7Hq84Vdh6KSXW8dKneb65QXMRvOcoecABNQ=;
	b=eSUi1BHTvj6LfVJb3GcpKp5csJbuSGxui4sOnoqiESFQqub9xL0zmLvUs2gnQ2pLIgHjbj
	tnBiQwY+Owi1SlOzhjxWXa599g5CSHMyLtvPuZj4OvssWqfpdCybgh/+QNoylSNkPxhskG
	NR9BBChG/pd5SIm6Q1YTm09Y1775RSk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-IjhXZVjcMPuauL9JNIZV7Q-1; Thu, 18 Aug 2022 00:07:57 -0400
X-MC-Unique: IjhXZVjcMPuauL9JNIZV7Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5E628039A1;
	Thu, 18 Aug 2022 04:07:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C770B492C3B;
	Thu, 18 Aug 2022 04:07:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3C8F9194E00F;
	Thu, 18 Aug 2022 04:07:55 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B4822194E00A for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 04:07:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A5081492CA5; Thu, 18 Aug 2022 04:07:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1662492C3B
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 04:07:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 898C43803911
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 04:07:54 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-378-EiNRrYWaMlKGvVCILF-7Fg-1; Thu, 18 Aug 2022 00:07:49 -0400
X-MC-Unique: EiNRrYWaMlKGvVCILF-7Fg-1
Received: by mail-pg1-f178.google.com with SMTP id 73so346359pgb.9;
 Wed, 17 Aug 2022 21:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=U/r+CY8lWSEvFEuXmpxEtml3rn7cEpqhLmD9eKbRoKw=;
 b=XFjPae6x0+q1PNucveFvtZRfD7doHzuJg9u4k40BkwIC3ZeRtJkl1Wn+1QyRBKODR+
 VCBtycbwklzaHw+pffctZvka8ij801I6C+fNhbcTZWgCG061ik50cHkq3Bl03r+sv4O/
 ioTnRxHdDoMsNIDjYrqpL5TvEsAeGSV9Rx7V6+oW8q9x5xLb+YluoIrYWMS+Bv5lxsZp
 gRthy6qpLFb5b11Q548BbPiKdQZoa85Hf1onWBuUGBEkqgdMRKhcFKACcRCg2Mj42TAb
 9zqytnHSukznkhNMVMjOJVmZS07L929P97xUlFlkun9FP2GYfjsGhTpefq/pl+lnWpa0
 spZg==
X-Gm-Message-State: ACgBeo34UFkM1IydrLYndfODH9e6RnBXZNRUrG2CGIV5DsnGHcY93mXK
 5E1nW73/e3dvpqrj7xhN1HYhruJhcfA=
X-Google-Smtp-Source: AA6agR79HfWQNVqr5TVIXxAvBDd2+JF37eL8jC5jSwUo7QxlBoTSrQcF7fHi9HWS1gLjJnHDnR0BAg==
X-Received: by 2002:a63:1b55:0:b0:41e:2cc8:4296 with SMTP id
 b21-20020a631b55000000b0041e2cc84296mr1095266pgm.510.1660795667705; 
 Wed, 17 Aug 2022 21:07:47 -0700 (PDT)
Received: from fedora.. ([103.230.104.3]) by smtp.gmail.com with ESMTPSA id
 p4-20020aa79e84000000b0052db82ad8b2sm349603pfq.123.2022.08.17.21.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 21:07:47 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org
Date: Thu, 18 Aug 2022 10:07:38 +0600
Message-Id: <20220818040738.12036-1-khalid.masum.92@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH v2] fscache: fix misdocumented parameter
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Khalid Masum <khalid.masum.92@gmail.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch fixes two warnings generated by make docs. The functions
fscache_use_cookie and fscache_unuse_cookie, both have a parameter
named cookie. But they are documented with the name "object" with
unclear description. Which generates the warning when creating docs.

This commit will replace the currently misdocumented parameter names
with the correct ones while adding proper descriptions.

CC: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
Changes since v1:
- Update commit message.
- Link: https://lore.kernel.org/lkml/20220521142446.4746-1-khalid.masum.92@gmail.com/

 include/linux/fscache.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 720874e6ee94..36e5dd84cf59 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -258,7 +258,7 @@ struct fscache_cookie *fscache_acquire_cookie(struct fscache_volume *volume,
 
 /**
  * fscache_use_cookie - Request usage of cookie attached to an object
- * @object: Object description
+ * @cookie: The cookie representing the cache object
  * @will_modify: If cache is expected to be modified locally
  *
  * Request usage of the cookie attached to an object.  The caller should tell
@@ -274,7 +274,7 @@ static inline void fscache_use_cookie(struct fscache_cookie *cookie,
 
 /**
  * fscache_unuse_cookie - Cease usage of cookie attached to an object
- * @object: Object description
+ * @cookie: The cookie representing the cache object
  * @aux_data: Updated auxiliary data (or NULL)
  * @object_size: Revised size of the object (or NULL)
  *
-- 
2.37.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

