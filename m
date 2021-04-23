Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DF038369A81
	for <lists+linux-cachefs@lfdr.de>; Fri, 23 Apr 2021 20:54:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-xGLo67JfOG20G58q2lselA-1; Fri, 23 Apr 2021 14:54:29 -0400
X-MC-Unique: xGLo67JfOG20G58q2lselA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70B4D19251A4;
	Fri, 23 Apr 2021 18:54:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 003A919D7D;
	Fri, 23 Apr 2021 18:54:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3CF0C1C97;
	Fri, 23 Apr 2021 18:54:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13NIquGI022010 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 23 Apr 2021 14:52:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 248FE2157FB4; Fri, 23 Apr 2021 18:52:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A5852166BB3
	for <linux-cachefs@redhat.com>; Fri, 23 Apr 2021 18:52:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E0C2A28805
	for <linux-cachefs@redhat.com>; Fri, 23 Apr 2021 18:52:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-321-Kt1ZvYTQPXS7lPrHrHQRgQ-1;
	Fri, 23 Apr 2021 14:52:51 -0400
X-MC-Unique: Kt1ZvYTQPXS7lPrHrHQRgQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3503B6124B;
	Fri, 23 Apr 2021 18:52:49 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 23 Apr 2021 14:52:48 -0400
Message-Id: <20210423185248.198750-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13NIquGI022010
X-loop: linux-cachefs@redhat.com
Cc: lhenriques@suse.de, willy@infradead.org, linux-cachefs@redhat.com,
	xiublu@redhat.com, linux-fsdevel@vger.kernel.org, idryomov@gmail.com
Subject: [Linux-cachefs] [PATCH] ceph: clamp length of a read to
	CEPH_MSG_MAX_DATA_LEN
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Ensure we clamp the final length of a read to CEPH_MSG_MAX_DATA_LEN.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

I'm likely going to fold this patch into the one that introduces
ceph_netfs_issue_op, so we don't have a regression in the series.

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 9939100f9f9d..ba459b15604d 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -212,7 +212,7 @@ static bool ceph_netfs_clamp_length(struct netfs_read_subrequest *subreq)
 	/* Truncate the extent at the end of the current block */
 	ceph_calc_file_object_mapping(&ci->i_layout, subreq->start, subreq->len,
 				      &objno, &objoff, &xlen);
-	subreq->len = xlen;
+	subreq->len = min(xlen, (u32)CEPH_MSG_MAX_DATA_LEN);
 	return true;
 }
 
-- 
2.31.1


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

