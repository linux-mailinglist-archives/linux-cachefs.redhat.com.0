Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C926C303F07
	for <lists+linux-cachefs@lfdr.de>; Tue, 26 Jan 2021 14:42:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-n91JoUMUMEyCJi7YA7CiCA-1; Tue, 26 Jan 2021 08:42:25 -0500
X-MC-Unique: n91JoUMUMEyCJi7YA7CiCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC066801AB3;
	Tue, 26 Jan 2021 13:42:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD8A05C276;
	Tue, 26 Jan 2021 13:42:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7B9C5002C;
	Tue, 26 Jan 2021 13:42:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QDfGSO003153 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 08:41:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A727310BDF; Tue, 26 Jan 2021 13:41:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A124494644
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 13:41:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B01A480122F
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 13:41:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-259-2G5ldNzYMQ2UGXflRXmEwA-1;
	Tue, 26 Jan 2021 08:41:09 -0500
X-MC-Unique: 2G5ldNzYMQ2UGXflRXmEwA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72424229C9;
	Tue, 26 Jan 2021 13:41:07 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org, idryomov@gmail.com, dhowells@redhat.com
Date: Tue, 26 Jan 2021 08:41:00 -0500
Message-Id: <20210126134103.240031-4-jlayton@kernel.org>
In-Reply-To: <20210126134103.240031-1-jlayton@kernel.org>
References: <20210126134103.240031-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10QDfGSO003153
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, willy@infradead.org
Subject: [Linux-cachefs] [PATCH 3/6] ceph: fix fscache invalidation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ensure that we invalidate the fscache whenever we invalidate the
pagecache.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/caps.c  | 1 +
 fs/ceph/inode.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fs/ceph/caps.c b/fs/ceph/caps.c
index ca07dfc60652..c40f713d6d21 100644
--- a/fs/ceph/caps.c
+++ b/fs/ceph/caps.c
@@ -1867,6 +1867,7 @@ static int try_nonblocking_invalidate(struct inode *inode)
 	u32 invalidating_gen = ci->i_rdcache_gen;
 
 	spin_unlock(&ci->i_ceph_lock);
+	ceph_fscache_invalidate(inode);
 	invalidate_mapping_pages(&inode->i_data, 0, -1);
 	spin_lock(&ci->i_ceph_lock);
 
diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index adc8fc3c5d85..2caa6df0bcdf 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -1906,6 +1906,7 @@ static void ceph_do_invalidate_pages(struct inode *inode)
 	orig_gen = ci->i_rdcache_gen;
 	spin_unlock(&ci->i_ceph_lock);
 
+	ceph_fscache_invalidate(inode);
 	if (invalidate_inode_pages2(inode->i_mapping) < 0) {
 		pr_err("invalidate_pages %p fails\n", inode);
 	}
-- 
2.29.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

