Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA8F780B7F
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Aug 2023 14:04:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692360275;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lDcYJRReO5Oz50abtIARIqTq384Q8ykP93XcN5V6OL4=;
	b=B/71t6w0VFg907Hinbru/RzYVTPQg2/PhPLTxO3aJuQNYEotlUk2/CCXmYkQ22H7tBdffE
	WSO/0Ba5BrivFERABdUcchrdFmZr6X/zMarm5Red2rv8F0WgPf3hSnUcje4HbndkEG7PVS
	MfjM7rFIlMMORM3VIV+IK8eVm4uzQ50=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-sPZgPzBYO6CX2iZZgXOzLA-1; Fri, 18 Aug 2023 08:04:32 -0400
X-MC-Unique: sPZgPzBYO6CX2iZZgXOzLA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 744CD85D063;
	Fri, 18 Aug 2023 12:04:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6394D492C13;
	Fri, 18 Aug 2023 12:04:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C4CF1194658C;
	Fri, 18 Aug 2023 12:04:29 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D59651946588 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 10 Aug 2023 12:21:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B25871121315; Thu, 10 Aug 2023 12:21:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAB501121314
 for <linux-cachefs@redhat.com>; Thu, 10 Aug 2023 12:21:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93A69185A78F
 for <linux-cachefs@redhat.com>; Thu, 10 Aug 2023 12:21:21 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com
 [45.249.212.255]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-pB6IMP4RPoupf5GdWKuMKw-1; Thu, 10 Aug 2023 08:21:19 -0400
X-MC-Unique: pB6IMP4RPoupf5GdWKuMKw-1
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RM5Fv40qxz1L9vx;
 Thu, 10 Aug 2023 20:04:51 +0800 (CST)
Received: from huawei.com (10.67.175.31) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 20:06:03 +0800
From: GUO Zihua <guozihua@huawei.com>
To: <dhowells@redhat.com>
Date: Thu, 10 Aug 2023 20:05:39 +0800
Message-ID: <20230810120539.27604-1-guozihua@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.31]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Fri, 18 Aug 2023 12:04:29 +0000
Subject: [Linux-cachefs] [PATCH -next] fscache: Remove duplicated include
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
Cc: linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove duplicated include for linux/uio.h. Resolves checkincludes
message.

Signed-off-by: GUO Zihua <guozihua@huawei.com>
---
 fs/fscache/io.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index 0d2b8dec8f82..ac9f19388bfb 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -9,7 +9,6 @@
 #include <linux/uio.h>
 #include <linux/bvec.h>
 #include <linux/slab.h>
-#include <linux/uio.h>
 #include "internal.h"
 
 /**
-- 
2.17.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

