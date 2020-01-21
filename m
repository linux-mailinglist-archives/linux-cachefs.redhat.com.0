Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CA1EE1451F6
	for <lists+linux-cachefs@lfdr.de>; Wed, 22 Jan 2020 10:58:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579687122;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BtVddPnzyyF3LUMT01OY+JPcFXdBtvGDYHm2bbIChuM=;
	b=Y3CEc+XwV41IgjtdeyFam2fICgfAjr6WCo1IFYt6FArjxMRS/bh0WganEhJNWRwmfz1k7y
	k/EN0/QTcnTdwRSH6BbT6NIhT9xznWoqdZ3EuK20clD9/7AH9yTqoiHPFvQJKluSXvHH4R
	ah2v0otVX6haafXYfsis/2A11BI7kf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-3O0788mnP5ulPYe_YLuYeg-1; Wed, 22 Jan 2020 04:58:41 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD5ED190D343;
	Wed, 22 Jan 2020 09:58:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3B77106F957;
	Wed, 22 Jan 2020 09:58:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47A8781971;
	Wed, 22 Jan 2020 09:58:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00L8nHPM032158 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 03:49:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5495C2166B2F; Tue, 21 Jan 2020 08:49:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50AC12166B2A
	for <linux-cachefs@redhat.com>; Tue, 21 Jan 2020 08:49:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05306185B0C0
	for <linux-cachefs@redhat.com>; Tue, 21 Jan 2020 08:49:15 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e07417;
	MF=alex.shi@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
	TI=SMTPD_---0ToHWsbJ_1579596549;
Received: from out30-133.freemail.mail.aliyun.com
	(out30-133.freemail.mail.aliyun.com [115.124.30.133]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-296-hnTTWcolMSuSESAxSM7ePg-1;
	Tue, 21 Jan 2020 03:49:13 -0500
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com
	fp:SMTPD_---0ToHWsbJ_1579596549) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 21 Jan 2020 16:49:09 +0800
From: Alex Shi <alex.shi@linux.alibaba.com>
To: 
Date: Tue, 21 Jan 2020 16:49:03 +0800
Message-Id: <1579596543-257734-1-git-send-email-alex.shi@linux.alibaba.com>
X-MC-Unique: hnTTWcolMSuSESAxSM7ePg-1
X-MC-Unique: 3O0788mnP5ulPYe_YLuYeg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00L8nHPM032158
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Wed, 22 Jan 2020 04:58:26 -0500
Cc: linux-cachefs@redhat.com, linux-kernel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH] fcache: remove unused macro
	CACHEFILES_KEYBUF_SIZE
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

after commit 402cb8dda949 ("fscache: Attach the index key and aux data
to the cookie"), no one use this macro anymore, remove it.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: David Howells <dhowells@redhat.com> 
Cc: linux-cachefs@redhat.com 
Cc: linux-kernel@vger.kernel.org 
---
 fs/cachefiles/namei.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index ecc8ecbbfa5a..e327f781dae7 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -18,8 +18,6 @@
 #include <linux/slab.h>
 #include "internal.h"
 
-#define CACHEFILES_KEYBUF_SIZE 512
-
 /*
  * dump debugging info about an object
  */
-- 
1.8.3.1


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

