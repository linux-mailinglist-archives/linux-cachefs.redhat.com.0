Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DE1B14258DB
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Oct 2021 19:06:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633626380;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hl7WTEWhkBfO7bMKCs9xY7RMXeG4YToVg0k7iww2LmY=;
	b=A9FcYvOPvK5CIF5Nya88jkCXMHb22K/snjLkeK/h9HMHkEwsu596o3zwkhzlusePe6insh
	5EuiU5g8qsYAvGIpRnxtChBv0vP3K/0Z9PAtNgpsBdRDsQUFiNXOwaVTkz1AdWGJfQddQA
	MutpO/0hf92i6qv50pKstJqAEikyx08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-X0q1NQTCPGSmH6B6n9cawA-1; Thu, 07 Oct 2021 13:06:15 -0400
X-MC-Unique: X0q1NQTCPGSmH6B6n9cawA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0B771A8F80D;
	Thu,  7 Oct 2021 16:20:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17BD8221645;
	Thu,  7 Oct 2021 16:19:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 343F44E58E;
	Thu,  7 Oct 2021 16:18:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 197FrJOI030001 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 7 Oct 2021 11:53:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8006FCF126; Thu,  7 Oct 2021 15:53:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABDA8D1F28;
	Thu,  7 Oct 2021 15:53:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
MIME-Version: 1.0
Date: Thu, 07 Oct 2021 16:53:04 +0100
Message-ID: <1961632.1633621984@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 197FrJOI030001
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Jeffrey Altman <jaltman@auristor.com>, linux-mm@kvack.org,
	linux-kernel@kvack.org, Jeff Layton <jlayton@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [GIT PULL] netfs, cachefiles, afs: Collected fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1961631.1633621984.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Can you pull this set of collected fixes please?  There are three:

 (1) Fix another couple of oopses in cachefiles tracing stemming from the
     possibility of passing in a NULL object pointer[1].

 (2) Fix netfs_clear_unread() to set READ on the iov_iter so that source it
     is passed to doesn't do the wrong thing (some drivers look at the flag
     on iov_iter rather than other available information to determine the
     direction)[2].

 (3) Fix afs_launder_page() to write back at the correct file position on
     the server so as not to corrupt data[3].

David

Link: https://lore.kernel.org/r/162729351325.813557.9242842205308443901.stgit@warthog.procyon.org.uk/ [1]
Link: https://lore.kernel.org/r/162886603464.3940407.3790841170414793899.stgit@warthog.procyon.org.uk [1]
Link: https://lore.kernel.org/r/163239074602.1243337.14154704004485867017.stgit@warthog.procyon.org.uk [1]
Link: https://lore.kernel.org/r/162729351325.813557.9242842205308443901.stgit@warthog.procyon.org.uk/ [2]
Link: https://lore.kernel.org/r/162886603464.3940407.3790841170414793899.stgit@warthog.procyon.org.uk [2]
Link: https://lore.kernel.org/r/163239074602.1243337.14154704004485867017.stgit@warthog.procyon.org.uk [2]
Link: https://lore.kernel.org/r/162880783179.3421678.7795105718190440134.stgit@warthog.procyon.org.uk/ [3]
Link: https://lore.kernel.org/r/162937512409.1449272.18441473411207824084.stgit@warthog.procyon.org.uk/ [3]
Link: https://lore.kernel.org/r/162981148752.1901565.3663780601682206026.stgit@warthog.procyon.org.uk/ [3]
Link: https://lore.kernel.org/r/163005741670.2472992.2073548908229887941.stgit@warthog.procyon.org.uk/ [3]
Link: https://lore.kernel.org/r/163221839087.3143591.14278359695763025231.stgit@warthog.procyon.org.uk/ [3]
Link: https://lore.kernel.org/r/163292980654.4004896.7134735179887998551.stgit@warthog.procyon.org.uk/ [3]

---
The following changes since commit 9e1ff307c779ce1f0f810c7ecce3d95bbae40896:

  Linux 5.15-rc4 (2021-10-03 14:08:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/misc-fixes-20211007

for you to fetch changes up to 5c0522484eb54b90f2e46a5db8d7a4ff3ff86e5d:

  afs: Fix afs_launder_page() to set correct start file position (2021-10-05 11:22:06 +0100)

----------------------------------------------------------------
netfslib, cachefiles and afs fixes

----------------------------------------------------------------
Dave Wysochanski (1):
      cachefiles: Fix oops with cachefiles_cull() due to NULL object

David Howells (2):
      netfs: Fix READ/WRITE confusion when calling iov_iter_xarray()
      afs: Fix afs_launder_page() to set correct start file position

 fs/afs/write.c                    | 3 +--
 fs/netfs/read_helper.c            | 2 +-
 include/trace/events/cachefiles.h | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

