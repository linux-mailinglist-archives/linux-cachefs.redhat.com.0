Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 843345983C3
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 15:10:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660828210;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hGUBY0uMx+S8nAN9eYXLTSccr+0zNRKrQDpsafPNfe0=;
	b=S5Yf7XO9dhmvT8ap+na2gqyiQ4TNzVGmZGjDAFAHhgYFNvPxDfZfgH1C2NOWhDWirv7BXj
	SgCb+eIBuRQ7xz/mzCQGInGLMSDzY85Ns+wlQqb6HjeoU01GghgZkM9PRGvRsMeicaVhFf
	PkNpeSLe3UvFMpg2HuPQfttqXnWS9No=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-EIKfIQQ3NHOGevMN0UHnYw-1; Thu, 18 Aug 2022 09:10:07 -0400
X-MC-Unique: EIKfIQQ3NHOGevMN0UHnYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C9621857F02;
	Thu, 18 Aug 2022 13:10:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F8992026D4C;
	Thu, 18 Aug 2022 13:10:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4F02A194E11C;
	Thu, 18 Aug 2022 13:10:06 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 59B801946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 09:54:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 38F7F4010D24; Thu, 18 Aug 2022 09:54:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34922400E726
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 09:54:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08D8018E0BF2
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 09:54:46 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com
 [45.249.212.255]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-rj2lNYc-NMKGkEZMl0o_Pw-1; Thu, 18 Aug 2022 05:54:42 -0400
X-MC-Unique: rj2lNYc-NMKGkEZMl0o_Pw-1
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4M7fqT2R7Qz1N7JQ;
 Thu, 18 Aug 2022 17:34:45 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 18 Aug 2022 17:38:07 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 18 Aug
 2022 17:38:06 +0800
From: Sun Ke <sunke32@huawei.com>
To: <dhowells@redhat.com>
Date: Thu, 18 Aug 2022 17:49:39 +0800
Message-ID: <20220818094939.1548183-1-sunke32@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Thu, 18 Aug 2022 13:10:05 +0000
Subject: [Linux-cachefs] [PATCH] cachefiles: fix error return code in
 cachefiles_ondemand_copen()
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
Cc: linux-cachefs@redhat.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, sunke32@huawei.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If size < 0; open request will fail, but cachefiles_ondemand_copen return 0.
Fix to return a negative error code.

Fixes: c8383054506c ("cachefiles: notify the user daemon when looking up cookie")
Signed-off-by: Sun Ke <sunke32@huawei.com>
---
 fs/cachefiles/ondemand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 1fee702d5529..a31d3ff0ce5f 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -161,6 +161,7 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
 		if (!IS_ERR_VALUE(size))
 			size = -EINVAL;
 		req->error = size;
+		ret = -EINVAL;
 		goto out;
 	}
 
-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

