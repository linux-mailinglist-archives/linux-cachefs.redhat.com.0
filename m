Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 92C452B0626
	for <lists+linux-cachefs@lfdr.de>; Thu, 12 Nov 2020 14:20:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-OKafMK31OhyyeYDOBich0A-1; Thu, 12 Nov 2020 08:20:04 -0500
X-MC-Unique: OKafMK31OhyyeYDOBich0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0CF9186E8C4;
	Thu, 12 Nov 2020 13:20:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8D186EF4A;
	Thu, 12 Nov 2020 13:20:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6018C181A06B;
	Thu, 12 Nov 2020 13:20:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AA7Pl5Y022308 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 10 Nov 2020 02:25:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 19E37110F0B8; Tue, 10 Nov 2020 07:25:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 132AB110F0A8
	for <linux-cachefs@redhat.com>; Tue, 10 Nov 2020 07:25:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCC2E8582A0
	for <linux-cachefs@redhat.com>; Tue, 10 Nov 2020 07:25:43 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com
	[45.249.212.190]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-222-3u5PjdbUN2-1kw0sey53KQ-1; Tue, 10 Nov 2020 02:25:39 -0500
X-MC-Unique: 3u5PjdbUN2-1kw0sey53KQ-1
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CVf7w47TJzkh8G;
	Tue, 10 Nov 2020 15:07:40 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
	DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server
	id 14.3.487.0; Tue, 10 Nov 2020 15:07:41 +0800
From: yangerkun <yangerkun@huawei.com>
To: <dhowells@redhat.com>
Date: Tue, 10 Nov 2020 15:11:26 +0800
Message-ID: <20201110071126.2990722-1-yangerkun@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AA7Pl5Y022308
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:19:57 -0500
Cc: yangerkun@huawei.com, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH] fscache: add leave debug tracing in
	fscache_submit_op
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
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is a enter tracing in fscache_submit_op without a leave tracing.
This may confuse someone when read the debug log.

Signed-off-by: yangerkun <yangerkun@huawei.com>
---
 fs/fscache/operation.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/fscache/operation.c b/fs/fscache/operation.c
index 4a5651d4904e..00cc6b0420cb 100644
--- a/fs/fscache/operation.c
+++ b/fs/fscache/operation.c
@@ -309,6 +309,7 @@ int fscache_submit_op(struct fscache_object *object,
 	}
 
 	spin_unlock(&object->lock);
+	_leave(" = %d", ret);
 	return ret;
 }
 
-- 
2.25.4


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

