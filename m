Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2F954A984
	for <lists+linux-cachefs@lfdr.de>; Tue, 14 Jun 2022 08:34:57 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-D262-1FQNbm-dNc2oDnsuQ-1; Tue, 14 Jun 2022 02:34:53 -0400
X-MC-Unique: D262-1FQNbm-dNc2oDnsuQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE02029ABA3A;
	Tue, 14 Jun 2022 06:34:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A373D492C3B;
	Tue, 14 Jun 2022 06:34:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 664281947070;
	Tue, 14 Jun 2022 06:34:52 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A26421947067 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 14 Jun 2022 06:34:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 858FD1121319; Tue, 14 Jun 2022 06:34:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 812181121314
 for <linux-cachefs@redhat.com>; Tue, 14 Jun 2022 06:34:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66AFE85A582
 for <linux-cachefs@redhat.com>; Tue, 14 Jun 2022 06:34:50 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-bT7Sp3R4NxynC0UqNAPh0w-1; Tue, 14 Jun 2022 02:34:48 -0400
X-MC-Unique: bT7Sp3R4NxynC0UqNAPh0w-1
Received: by mail-pj1-f49.google.com with SMTP id
 g10-20020a17090a708a00b001ea8aadd42bso8219078pjk.0
 for <linux-cachefs@redhat.com>; Mon, 13 Jun 2022 23:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:references:to:cc:in-reply-to:content-transfer-encoding;
 bh=skhpWdz/fVr5Z4eL8Xj0/NttsCVeBDmRP9w0g3/Whag=;
 b=trCRlP0y/HBFQV/7phl5Q9mn+UsSUEAZMSXQCaRiRxYEsvRBDDV9tzwAy/Bc1ygiRr
 GA2kBfKtBgO/KxcNUVhA5ASiutdIpPlhpumTYgRaGvXbf6e37UCVMUpewCs4rkWBDBZS
 BiV73UcPOCBrcYQ9e9rDRRoww8R6vva5fELyhisR0fPF6Bfy6dGScRRmKtmf1v3mnxSG
 pMvjgrzRTZoT8XmEOAFX8UNZYNAt0oEgwC/idMUCpmas0j6d63kcsbW/1mZUQZgsh7yi
 t83rCVKdRXlxdItU984ECRlO8NeKhT/iSVdLDiKI00+MsbACoxIhwjSwKFdqLTsFwB1T
 TucQ==
X-Gm-Message-State: AJIora/C9JFZq/+BhKzMFocrj3Q4YSS9f+INrxSgU/t/4zzyu3avrWd9
 c5m7kSkwJAQqisSbrrQkWZszyA==
X-Google-Smtp-Source: AGRyM1uEWpuqApQ0YFIqPF26m4yeyOyFetT/gzggOr8wuWGCa0nbZWfha1AghEBVfB+9NYDL7BJdRQ==
X-Received: by 2002:a17:902:b784:b0:168:b8ee:a27f with SMTP id
 e4-20020a170902b78400b00168b8eea27fmr2722444pls.107.1655188487024; 
 Mon, 13 Jun 2022 23:34:47 -0700 (PDT)
Received: from [10.4.226.233] ([139.177.225.232])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a1709027fc400b00163fa4b7c12sm6317799plb.34.2022.06.13.23.34.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 23:34:46 -0700 (PDT)
Message-ID: <275d80bb-2f14-58c3-e829-119c88bf18f9@bytedance.com>
Date: Tue, 14 Jun 2022 14:34:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
From: Jia Zhu <zhujia.zj@bytedance.com>
References: <0a015f53-00f1-57d0-bca3-74cd7db8ed2e@bytedance.com>
To: dhowells@redhat.com, Jeffle Xu <jefflexu@linux.alibaba.com>,
 xiang@kernel.org
In-Reply-To: <0a015f53-00f1-57d0-bca3-74cd7db8ed2e@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Linux-cachefs] [PATCH 1/1] cachefiles: Add a command to restore
 on-demand requests
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
Cc: linux-fsdevel@vger.kernel.org, zhujia.zj@bytedance.com,
 linux-cachefs@redhat.com, linux-erofs@lists.ozlabs.org, chao@kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


In on-demand read scenario, as long as the device connection
is not released, user daemon can restore the inflight request
by setting the request flag to CACHEFILES_REQ_NEW.

Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
---
  fs/cachefiles/daemon.c   |  1 +
  fs/cachefiles/internal.h |  3 +++
  fs/cachefiles/ondemand.c | 25 +++++++++++++++++++++++++
  3 files changed, 29 insertions(+)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 5956bf10cb4b..280104171996 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -77,6 +77,7 @@ static const struct cachefiles_daemon_cmd 
cachefiles_daemon_cmds[] = {
  	{ "tag",	cachefiles_daemon_tag		},
  #ifdef CONFIG_CACHEFILES_ONDEMAND
  	{ "copen",	cachefiles_ondemand_copen	},
+	{ "restore",	cachefiles_ondemand_restore	},
  #endif
  	{ "",		NULL				}
  };
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 6cba2c6de2f9..402f552a9756 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -289,6 +289,9 @@ extern ssize_t 
cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
  extern int cachefiles_ondemand_copen(struct cachefiles_cache *cache,
  				     char *args);

+extern int cachefiles_ondemand_restore(struct cachefiles_cache *cache,
+				     char *args);
+
  extern int cachefiles_ondemand_init_object(struct cachefiles_object 
*object);
  extern void cachefiles_ondemand_clean_object(struct cachefiles_object 
*object);

diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 2506e6d56965..0d0ed82f4814 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -174,6 +174,31 @@ int cachefiles_ondemand_copen(struct 
cachefiles_cache *cache, char *args)
  	return ret;
  }

+int cachefiles_ondemand_restore(struct cachefiles_cache *cache, char *args)
+{
+	struct cachefiles_req *req;
+	XA_STATE(xas, &cache->reqs, 0);
+
+	if (!test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags))
+		return -EOPNOTSUPP;
+
+	if (test_bit(CACHEFILES_DEAD, &cache->flags))
+		return -EIO;
+
+	xas_lock(&xas);
+	/*
+	 * Search the requests that being proceessed before
+	 * the user daemon crashed.
+	 * Set the CACHEFILES_REQ_NEW flag and user daemon will reprocess it.
+	 */
+	xas_for_each(&xas, req, ULONG_MAX) {
+		if (!xas_get_mark(&xas, CACHEFILES_REQ_NEW))
+			xas_set_mark(&xas, CACHEFILES_REQ_NEW);
+	}
+	xas_unlock(&xas);
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

