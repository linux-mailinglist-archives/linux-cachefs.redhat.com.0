Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EF68B3AECA5
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Jun 2021 17:40:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624290028;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pW0YeG6TvksdXIEVyMvSwAGKjDXbUDD1vDlMPfUwx1U=;
	b=dKZTVyUPcS9MGtIjzN6iE5MAWnCTPB7j9+7e3pOOSTIkNp6CBYfoAuSs3p5vncTA/pTSza
	onGa4AoLWsS5rcmJJ2pKvQF2aCYywxuWJxsYXfcNH5n2UnseX1mgTjYU+tmQTL1yDMcalL
	PysW2S5LE8Xa92YvEknGmuEfB7+qRzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-Skii6zb8MR-70IO5kwyIIw-1; Mon, 21 Jun 2021 11:40:20 -0400
X-MC-Unique: Skii6zb8MR-70IO5kwyIIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAD9A100CF73;
	Mon, 21 Jun 2021 15:40:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08374620DE;
	Mon, 21 Jun 2021 15:40:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DFD41809C9A;
	Mon, 21 Jun 2021 15:40:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LFeCel030115 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 11:40:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 649D21000320; Mon, 21 Jun 2021 15:40:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-65.rdu2.redhat.com
	[10.10.118.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5CEE110013D6;
	Mon, 21 Jun 2021 15:40:07 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com, linux-afs@lists.infradead.org
Date: Mon, 21 Jun 2021 16:40:06 +0100
Message-ID: <162429000639.2770648.6368710175435880749.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: Andrew W Elble <aweits@rit.edu>, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	ceph-devel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH v3 0/2] netfs, afs: Fix write_begin/end
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


Here are some patches to fix netfs_write_begin() and afs_write_end() in the
following ways:

 (1) In netfs_write_begin(), extract the decision about whether to skip a
     page out to its own helper and have that clear around the region to be
     written, but not clear that region.  This requires the filesystem to
     patch it up afterwards if the hole doesn't get completely filled.

 (2) Use offset_in_thp() in (1) rather than manually calculating the offset
     into the page.

 (3) Due to (1), afs_write_end() now needs to handle short data write into
     the page by generic_perform_write().  I've adopted an analogous
     approach to ceph of just returning 0 in this case and letting the
     caller go round again.

Also add a note that (in the future) the len parameter may extend beyond
the page allocated.  This is because the page allocation is deferred to
write_begin() and that gets to decide what size of THP to allocate.

The patches can be found here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=afs-fixes

David

Link: https://lore.kernel.org/r/20210613233345.113565-1-jlayton@kernel.org/
Link: https://lore.kernel.org/r/162367681795.460125.11729955608839747375.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/162391823192.1173366.9740514875196345746.stgit@warthog.procyon.org.uk/ # v3

Changes
=======

ver #3:
   - Drop the bits that make afs take account of len exceeding the end of
     the page in afs_write_begin/end().

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
David Howells (1):
      afs: Fix afs_write_end() to handle short writes

Jeff Layton (1):
      netfs: fix test for whether we can skip read when writing beyond EOF


 fs/netfs/read_helper.c | 49 +++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 13 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

