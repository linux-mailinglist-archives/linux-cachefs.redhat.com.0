Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAF93AAEAD
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Jun 2021 10:24:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623918247;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rPz2JjW88Qrvqjj7AaXhilQF+bh/81QrbKwpGEXqr1w=;
	b=HaK3EFMy43ERiylWRrUKedklfKiShN8q7llCzm6p6bP5pOKF7m1SvN99S2R2z4phwUvdiP
	yOVylziZ4p0ol1M24hxG3gN+JPNDz2/c03z00AdbHWrwFQ6qlagEOVIBJWhkgrVDdNLHrZ
	XyqKSn6o2KRUX2Hdl6OIWTlHpkhIt5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-_nR0VgvTM_uP6PeReKrWJg-1; Thu, 17 Jun 2021 04:24:06 -0400
X-MC-Unique: _nR0VgvTM_uP6PeReKrWJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8748801106;
	Thu, 17 Jun 2021 08:24:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA2686090F;
	Thu, 17 Jun 2021 08:24:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D66554A717;
	Thu, 17 Jun 2021 08:24:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15H8NvcZ006291 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 17 Jun 2021 04:23:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ABB225C1CF; Thu, 17 Jun 2021 08:23:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-65.rdu2.redhat.com
	[10.10.118.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD47B5C1C5;
	Thu, 17 Jun 2021 08:23:52 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com, linux-afs@lists.infradead.org
Date: Thu, 17 Jun 2021 09:23:51 +0100
Message-ID: <162391823192.1173366.9740514875196345746.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: Andrew W Elble <aweits@rit.edu>, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	ceph-devel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH v2 0/3] netfs,
	afs: Fix netfs_write_begin and THP handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Here are some patches to fix netfs_write_begin() and the handling of THPs in
that and afs_write_begin/end() in the following ways:

 (1) Use offset_in_thp() rather than manually calculating the offset into
     the page.

 (2) In the future, the len parameter may extend beyond the page allocated.
     This is because the page allocation is deferred to write_begin() and
     that gets to decide what size of THP to allocate.

 (3) In netfs_write_begin(), extract the decision about whether to skip a
     page out to its own helper and have that clear around the region to be
     written, but not clear that region.  This requires the filesystem to
     patch it up afterwards if the hole doesn't get completely filled.

 (4) Due to (3), afs_write_end() now needs to handle short data write into
     the page by generic_perform_write().  I've adopted an analogous
     approach to ceph of just returning 0 in this case and letting the
     caller go round again.

I wonder if generic_perform_write() should pass in a flag indicating
whether this is the first attempt or a second attempt at this, and on the
second attempt we just completely prefill the page and just let the partial
write stand - which we have to do if the page was already uptodate when we
started.

The patches can be found here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=afs-fixes

David

Link: https://lore.kernel.org/r/20210613233345.113565-1-jlayton@kernel.org/
Link: https://lore.kernel.org/r/162367681795.460125.11729955608839747375.stgit@warthog.procyon.org.uk/

Changes
=======

ver #2:
   - Removed a var that's no longer used (spotted by the kernel test robot)
   - Removed a forgotten "noinline".

ver #1:
   - Prefixed the Jeff's new helper with "netfs_".
   - Don't call zero_user_segments() for a full-page write.
   - Altered the beyond-last-page check to avoid a DIV.
   - Removed redundant zero-length-file check.
   - Added patches to fix afs.

---
David Howells (2):
      afs: Handle len being extending over page end in write_begin/write_end
      afs: Fix afs_write_end() to handle short writes

Jeff Layton (1):
      netfs: fix test for whether we can skip read when writing beyond EOF


 fs/afs/write.c         | 12 +++++++++--
 fs/netfs/read_helper.c | 49 +++++++++++++++++++++++++++++++-----------
 2 files changed, 46 insertions(+), 15 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

