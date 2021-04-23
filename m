Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9A544369AFF
	for <lists+linux-cachefs@lfdr.de>; Fri, 23 Apr 2021 21:43:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-rwd0NtzAMnKNyMIq_qyjUg-1; Fri, 23 Apr 2021 15:43:46 -0400
X-MC-Unique: rwd0NtzAMnKNyMIq_qyjUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C238F18B9F4A;
	Fri, 23 Apr 2021 19:43:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B5E260BD8;
	Fri, 23 Apr 2021 19:43:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF7A51806D1A;
	Fri, 23 Apr 2021 19:43:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13NJhdMJ025434 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 23 Apr 2021 15:43:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C10342095BC0; Fri, 23 Apr 2021 19:43:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC49420962E3
	for <linux-cachefs@redhat.com>; Fri, 23 Apr 2021 19:43:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34B718007DD
	for <linux-cachefs@redhat.com>; Fri, 23 Apr 2021 19:43:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-194-UX9grXzYNAWCttYTmlbrmw-1;
	Fri, 23 Apr 2021 15:43:35 -0400
X-MC-Unique: UX9grXzYNAWCttYTmlbrmw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22B2D613C3;
	Fri, 23 Apr 2021 19:43:33 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 23 Apr 2021 15:43:31 -0400
Message-Id: <20210423194331.203697-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13NJhdMJ025434
X-loop: linux-cachefs@redhat.com
Cc: lhenriques@suse.de, willy@infradead.org, linux-cachefs@redhat.com,
	xiublu@redhat.com, linux-fsdevel@vger.kernel.org, idryomov@gmail.com
Subject: [Linux-cachefs] [PATCH v2] ceph: clamp length of an OSD read to
	rsize mount option
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There's a hard limit on how large a read we can do from the OSD, defined
as CEPH_MSG_MAX_DATA_LEN (currently, 64M). It's possible to create a
file that is backed by larger objects than that (and indeed, xfstest
ceph/001 does just that).

Ensure we clamp the final length of a read to the rsize, which defaults
to CEPH_MSG_MAX_DATA_LEN, but can be set lower.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

I think this version is more correct. Again, I'll plan to roll this into
the earlier patch that adds the clamp_length op.

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 9939100f9f9d..c1570fada3d8 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -205,6 +205,7 @@ static void ceph_netfs_expand_readahead(struct netfs_read_request *rreq)
 static bool ceph_netfs_clamp_length(struct netfs_read_subrequest *subreq)
 {
 	struct inode *inode = subreq->rreq->mapping->host;
+	struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
 	struct ceph_inode_info *ci = ceph_inode(inode);
 	u64 objno, objoff;
 	u32 xlen;
@@ -212,7 +213,7 @@ static bool ceph_netfs_clamp_length(struct netfs_read_subrequest *subreq)
 	/* Truncate the extent at the end of the current block */
 	ceph_calc_file_object_mapping(&ci->i_layout, subreq->start, subreq->len,
 				      &objno, &objoff, &xlen);
-	subreq->len = xlen;
+	subreq->len = min(xlen, fsc->mount_options->rsize);
 	return true;
 }
 
-- 
2.31.1


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

