Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D36D73A49C6
	for <lists+linux-cachefs@lfdr.de>; Fri, 11 Jun 2021 22:05:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-rIPc2a7NNPe-BpmZiPIy0A-1; Fri, 11 Jun 2021 16:05:07 -0400
X-MC-Unique: rIPc2a7NNPe-BpmZiPIy0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDFD31922962;
	Fri, 11 Jun 2021 20:05:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20A1C5D9D7;
	Fri, 11 Jun 2021 20:05:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E2491D8A;
	Fri, 11 Jun 2021 20:05:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15BJxCg6003902 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 11 Jun 2021 15:59:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5658C2044019; Fri, 11 Jun 2021 19:59:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 526842044012
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 19:59:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6AC91825068
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 19:59:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-358-HYi88436Oo-0BZb28tohnw-1;
	Fri, 11 Jun 2021 15:59:07 -0400
X-MC-Unique: HYi88436Oo-0BZb28tohnw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 588DC60E0C;
	Fri, 11 Jun 2021 19:59:05 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 11 Jun 2021 15:59:04 -0400
Message-Id: <20210611195904.160416-1-jlayton@kernel.org>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 15BJxCg6003902
X-loop: linux-cachefs@redhat.com
Cc: Andrew W Elble <aweits@rit.edu>, stable@vger.kernel.org,
	linux-cachefs@redhat.com, willy@infradead.org, pfmeec@rit.edu,
	idryomov@gmail.com
Subject: [Linux-cachefs] [PATCH] ceph: fix write_begin optimization when
	write is beyond EOF
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It's not sufficient to skip reading when the pos is beyond the EOF.
There may be data at the head of the page that we need to fill in
before the write. Only elide the read if the pos is beyond the last page
in the file.

Cc: <stable@vger.kernel.org> # v5.10 .. v5.12
Fixes: 1cc1699070bd ("ceph: fold ceph_update_writeable_page into ceph_write_begin")
Reported-by: Andrew W Elble <aweits@rit.edu>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Note to stable maintainers: This is needed in v5.10.z - v5.12.z. In
v5.13, we've moved to using the new netfs_read_helper code so this isn't
necessary there.

I also now have a simple testcase for this that I'll submit to xfstests
early next week.

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 26e66436f005..e636fb8275e1 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1353,11 +1353,11 @@ static int ceph_write_begin(struct file *file, struct address_space *mapping,
 		/*
 		 * In some cases we don't need to read at all:
 		 * - full page write
-		 * - write that lies completely beyond EOF
+		 * - write that lies in a page that is completely beyond EOF
 		 * - write that covers the the page from start to EOF or beyond it
 		 */
 		if ((pos_in_page == 0 && len == PAGE_SIZE) ||
-		    (pos >= i_size_read(inode)) ||
+		    (index > (i_size_read(inode) / PAGE_SIZE)) ||
 		    (pos_in_page == 0 && (pos + len) >= i_size_read(inode))) {
 			zero_user_segments(page, 0, pos_in_page,
 					   pos_in_page + len, PAGE_SIZE);
-- 
2.31.1


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

