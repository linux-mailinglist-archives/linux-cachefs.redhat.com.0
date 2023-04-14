Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DC56E2943
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Apr 2023 19:24:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681493087;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZbtiXkA1UScpzIPZGcb2ElYiX6PmJAS1bIp5aCXjB+o=;
	b=Hhv0h40Wssj9/Q8xJ5Eg09ymm9+jME1KbSpDfFNSQRhheTJyzBj3IEMVl3dlH7cQY/cieT
	G1ebv3C6iWL9woW9vXMH5WRR8caUXGaf9CFGrDoKXzqje6raQFuWHXeSIa2y7iniAuNnU7
	PGAs1OwXOPXgyh6XPsLR0jP2qDjPx00=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-st_MTS1ZOUyY3D5zRjbP5g-1; Fri, 14 Apr 2023 13:24:37 -0400
X-MC-Unique: st_MTS1ZOUyY3D5zRjbP5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A573E857FB3;
	Fri, 14 Apr 2023 17:24:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9BB7940C6E20;
	Fri, 14 Apr 2023 17:24:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 78C9719472CD;
	Fri, 14 Apr 2023 17:24:08 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 60FA41946589 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 14 Apr 2023 17:24:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 44235112132D; Fri, 14 Apr 2023 17:24:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C9C91121320
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 17:24:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B1C7857A9F
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 17:24:07 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-MJaZM9UeOIGD_XmdgdmqEQ-1; Fri, 14 Apr 2023 13:23:51 -0400
X-MC-Unique: MJaZM9UeOIGD_XmdgdmqEQ-1
Received: by mail-pl1-f172.google.com with SMTP id n17so3011337pln.8
 for <linux-cachefs@redhat.com>; Fri, 14 Apr 2023 10:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681493017; x=1684085017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qgUvM997QJXfBj7OoFl5jxJ2P02ysazlJ3MfSoqKoTg=;
 b=Z5i//xFERoHmgheePGOQRr97F0YxqQwWr5gBJvPWiJY0bIhWot46ZmMZzt5PSxhDjG
 RJWi1V75Wcwr2RSKfEIYLtXWx3rNCTVvzgM8A5Us3Zl3GgIh0C1kjlWbQ3j9wWhR1ZXX
 ydZVeUy5sQZqcedX1OpYbrPP3s/gafCfax5Ds8zf7mSWGWkpywg4M7A4EFSf2sOZMOfD
 Kuum7LbGRXG3LRP1X2g2x8l7Y+oxf2JnqsxMuzJdpgLd6Z6Bmf0B93I0RxWOoVDX0ht+
 yYj34HjfoojxaQF6VbXglPI6UPdes/GQZjoP0T93X2JYy3mr2t0pRTKwm8K3QWknKpsy
 w+xQ==
X-Gm-Message-State: AAQBX9cXsrUIl/hBvoFAqvt511YWdnQPBUBbzRIIkad+xNFvSq7ceWOC
 Ai/a+Ib66PFzIlc4pNQM8WUP7g==
X-Google-Smtp-Source: AKy350aBgZHg/laFWLHOBjKb0DZ6Hi2flL729hh8PovcVeBU4tyJFAUENy+tE8fTCKXuvB2+OR9kVQ==
X-Received: by 2002:a05:6a20:8f2a:b0:ee:b24e:a40b with SMTP id
 b42-20020a056a208f2a00b000eeb24ea40bmr335653pzk.53.1681493017046; 
 Fri, 14 Apr 2023 10:23:37 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.243])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a631f4c000000b0051b8172fa68sm370315pgm.38.2023.04.14.10.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 10:23:36 -0700 (PDT)
From: Jia Zhu <zhujia.zj@bytedance.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Sat, 15 Apr 2023 01:22:39 +0800
Message-Id: <20230414172239.33743-6-zhujia.zj@bytedance.com>
In-Reply-To: <20230414172239.33743-1-zhujia.zj@bytedance.com>
References: <20230414172239.33743-1-zhujia.zj@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Linux-cachefs] [PATCH V6 5/5] cachefiles: add restore command to
 recover inflight ondemand read requests
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
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Previously, in ondemand read scenario, if the anonymous fd was closed by
user daemon, inflight and subsequent read requests would return EIO.
As long as the device connection is not released, user daemon can hold
and restore inflight requests by setting the request flag to
CACHEFILES_REQ_NEW.

Suggested-by: Gao Xiang <hsiangkao@linux.alibaba.com>
Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
Signed-off-by: Xin Yin <yinxin.x@bytedance.com>
Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/daemon.c   |  1 +
 fs/cachefiles/internal.h |  3 +++
 fs/cachefiles/ondemand.c | 23 +++++++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 70caa1946207d..3f24905f40661 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -77,6 +77,7 @@ static const struct cachefiles_daemon_cmd cachefiles_daemon_cmds[] = {
 	{ "tag",	cachefiles_daemon_tag		},
 #ifdef CONFIG_CACHEFILES_ONDEMAND
 	{ "copen",	cachefiles_ondemand_copen	},
+	{ "restore",	cachefiles_ondemand_restore	},
 #endif
 	{ "",		NULL				}
 };
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 26e5f8f123ef1..4a87c9d714a94 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -303,6 +303,9 @@ extern ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
 extern int cachefiles_ondemand_copen(struct cachefiles_cache *cache,
 				     char *args);
 
+extern int cachefiles_ondemand_restore(struct cachefiles_cache *cache,
+					char *args);
+
 extern int cachefiles_ondemand_init_object(struct cachefiles_object *object);
 extern void cachefiles_ondemand_clean_object(struct cachefiles_object *object);
 
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 8e130de952f7d..b8fbbb1961bbc 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -182,6 +182,29 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
 	return ret;
 }
 
+int cachefiles_ondemand_restore(struct cachefiles_cache *cache, char *args)
+{
+	struct cachefiles_req *req;
+
+	XA_STATE(xas, &cache->reqs, 0);
+
+	if (!test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags))
+		return -EOPNOTSUPP;
+
+	/*
+	 * Reset the requests to CACHEFILES_REQ_NEW state, so that the
+	 * requests have been processed halfway before the crash of the
+	 * user daemon could be reprocessed after the recovery.
+	 */
+	xas_lock(&xas);
+	xas_for_each(&xas, req, ULONG_MAX)
+		xas_set_mark(&xas, CACHEFILES_REQ_NEW);
+	xas_unlock(&xas);
+
+	wake_up_all(&cache->daemon_pollwq);
+	return 0;
+}
+
 static int cachefiles_ondemand_get_fd(struct cachefiles_req *req)
 {
 	struct cachefiles_object *object;
-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

