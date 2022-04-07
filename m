Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D092F4F7E96
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 14:03:09 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-87_Eo__xMBehQ0kX00BwwQ-1; Thu, 07 Apr 2022 08:03:05 -0400
X-MC-Unique: 87_Eo__xMBehQ0kX00BwwQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B80308C72C5;
	Thu,  7 Apr 2022 12:02:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 74266C44AE9;
	Thu,  7 Apr 2022 12:02:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1ACC11940340;
	Thu,  7 Apr 2022 12:02:35 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2E0841947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 12:02:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 21C65145B980; Thu,  7 Apr 2022 12:02:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C14A145B97F
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 12:02:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01BFA108C1CB
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 12:02:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-kIzfY6jLPXmGAyyYjttTWg-1; Thu, 07 Apr 2022 08:02:29 -0400
X-MC-Unique: kIzfY6jLPXmGAyyYjttTWg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 60D6161EE9;
 Thu,  7 Apr 2022 12:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5A7C385A8;
 Thu,  7 Apr 2022 12:02:26 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org,
	dhowells@redhat.com
Date: Thu,  7 Apr 2022 08:02:20 -0400
Message-Id: <20220407120224.76156-2-jlayton@kernel.org>
In-Reply-To: <20220407120224.76156-1-jlayton@kernel.org>
References: <20220407120224.76156-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Linux-cachefs] [RFC PATCH 1/5] netfs: don't error out on short DIO
 reads
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
Cc: linux-cachefs@redhat.com, idryomov@gmail.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There's no reason that userland can't request to read beyond the EOF. A
short read is expected in that situation.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/netfs/io.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index aaaafc3e1601..b94f2d27127e 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -728,11 +728,6 @@ ssize_t netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 		}
 
 		ret = rreq->error;
-		if (ret == 0 && rreq->submitted < rreq->len &&
-		    rreq->origin == NETFS_DIO_READ) {
-			trace_netfs_failure(rreq, NULL, ret, netfs_fail_short_read);
-			ret = -EIO;
-		}
 		if (ret == 0)
 			ret = netfs_dio_copy_to_dest(rreq);
 		if (ret == 0) {
-- 
2.35.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

