Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC025EF075
	for <lists+linux-cachefs@lfdr.de>; Thu, 29 Sep 2022 10:29:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664440179;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RCkIGy7BeqIArME+VccA9I9IYyKQFpR3Qr78b2XZcNo=;
	b=YeD9SojYlaY7Qky7DX5B9YXNPH3fiv3DEi5J6OgHkPKCl3rj1VbtP9nUrs4oC3zF/H07sP
	3KPoyzrAwpGhvDwq6YjnrItU74jchRG+1PqRP0GPdr3Cfs/5ToFUFK0eqKSV3Q0JKuz2HO
	TgY+vhvIpXOorTGFvcGn9nwKChnBUL0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-mui-eSviN16YyncJi6VMbw-1; Thu, 29 Sep 2022 04:29:37 -0400
X-MC-Unique: mui-eSviN16YyncJi6VMbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D172C86EB30;
	Thu, 29 Sep 2022 08:29:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55771145BEE0;
	Thu, 29 Sep 2022 08:29:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2106B1946A48;
	Thu, 29 Sep 2022 08:29:36 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 63E531946586 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 17 Sep 2022 09:59:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4EE1C1121315; Sat, 17 Sep 2022 09:59:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 476841121314
 for <linux-cachefs@redhat.com>; Sat, 17 Sep 2022 09:59:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D70A811E81
 for <linux-cachefs@redhat.com>; Sat, 17 Sep 2022 09:59:46 +0000 (UTC)
Received: from mail-m974.mail.163.com (mail-m974.mail.163.com
 [123.126.97.4]) by relay.mimecast.com with ESMTP id
 us-mta-582-wsZZ2Z7GO8CVAaO0HjoiOw-1; Sat, 17 Sep 2022 05:59:42 -0400
X-MC-Unique: wsZZ2Z7GO8CVAaO0HjoiOw-1
Received: from DESKTOP-CE2KKHI.localdomain (unknown [124.160.210.227])
 by smtp4 (Coremail) with SMTP id HNxpCgDHeN_9liVjqKMmdw--.4980S2;
 Sat, 17 Sep 2022 17:44:29 +0800 (CST)
From: williamsukatube@163.com
To: linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org
Date: Sat, 17 Sep 2022 17:44:27 +0800
Message-Id: <20220917094427.4665-1-williamsukatube@163.com>
MIME-Version: 1.0
X-CM-TRANSID: HNxpCgDHeN_9liVjqKMmdw--.4980S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrAr18XrWrtry3uw4UJF4kCrg_yoWxGrXE9w
 n7Cr4kurW5JFyxua4ftFs2q3Wjgw18Zr90vFs5tw1akFnxJa1xKanxJ345CF4ag3s7CFy8
 XFyrtFyj9wnxGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRAxhd3UUUUU==
X-Originating-IP: [124.160.210.227]
X-CM-SenderInfo: xzlozx5dpv3yxdwxuvi6rwjhhfrp/xtbBSR1-g1aEEv4ynQAAs5
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Thu, 29 Sep 2022 08:29:35 +0000
Subject: [Linux-cachefs] [PATCH -next] fscache: Remove duplicate include
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
Cc: William Dean <williamsukatube@163.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: William Dean <williamsukatube@163.com>

In file: fs/fscache/io.c,
'#include <linux/uio.h>' has included at line: 9,
now it is duplicated include at line: 12, so delete duplicated include.

Signed-off-by: William Dean <williamsukatube@163.com>
---
 fs/fscache/io.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index 3af3b08a9bb3..a67c50efc133 100644
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
2.25.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

