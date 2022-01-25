Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CB949B576
	for <lists+linux-cachefs@lfdr.de>; Tue, 25 Jan 2022 14:57:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643119075;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iIjuNbOVXKodcImE+8ldm2Osh3QCt0kVXU/kyPbmunk=;
	b=LsEarryJ0YOte5j4p7Y2joApKgpEZPl3B4Ia71l5cMEmy5CpOo9d+vQgcNiiWBJwmt3Ix2
	ujtroKJYuCc81HluTdcIAO5UmYBryIGDlzuhSsJZZu6nb93pDJz3va4w6zkG7o0pkmjLIn
	xXUClKTqYda1Ss6d2J/znPGai0UcA4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-7L06ZAzMOb670Uc28N5gCg-1; Tue, 25 Jan 2022 08:57:52 -0500
X-MC-Unique: 7L06ZAzMOb670Uc28N5gCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC14686A078;
	Tue, 25 Jan 2022 13:57:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 290437E121;
	Tue, 25 Jan 2022 13:57:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F20161809CB8;
	Tue, 25 Jan 2022 13:57:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20PDvdFb023175 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 Jan 2022 08:57:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 76B2A7C141; Tue, 25 Jan 2022 13:57:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4EA27D3D6;
	Tue, 25 Jan 2022 13:57:05 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: smfrench@gmail.com, nspmangalore@gmail.com
Date: Tue, 25 Jan 2022 13:57:04 +0000
Message-ID: <164311902471.2806745.10187041199819525677.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, jlayton@kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org
Subject: [Linux-cachefs] [RFC][RFC PATCH 0/7] cifs: In-progress conversion
 to use iov_iters and netfslib
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi Steve,

Okay, I've has a go at crudely splitting up my conversion of cifs to use
netfslib into separate patches and I thought I'd post it for you and Shyam
to have a look over:

 (1) The conversion from ->readpages() to ->readahead().

 (2) A patch that does some random miscellaneous bits.

 (3) Change the I/O paths to use an iterator all the way to the socket
     instead of a page list.  Note that cifs won't compile from this patch
     until patch 6.

 (4) Replace cifs's writepages implementation with the one from afs and
     make it deal with variable rsize and stuff like that.  This sets up
     iterators rather than page lists.

     This also makes direct/unbuffered write use an iterator.  This
     probably requires more massaging to make it handle credits.

 (5) Modify cifs_readahead() to hand an iterator down.

 (6) Make direct and unbuffered reads hand an iterator down.  Note that the
     iterator refers to the original buffers and bounce pages aren't used.

 (7) Make cifs use netfslib for reading.

As stated, patches 3, 4 and 5 don't compile because the pagelist struct
members disappeared to make way for the iterators.  This avoids duplicating
various functions in the transport and transport security code.  I'm not
sure how best to deal with this - maybe by setting up bvecs instead of
pagelists at the top level and then I can hand a bvec-class iter down.

The patches can also be found here.  Note that this requires some of the
patches from my netfs-lib branch.

https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=cifs-experimental

David
---
David Howells (7):
      cifs: Transition from ->readpages() to ->readahead()
      cifs: Miscellaneous bits
      cifs: Change the I/O paths to use an iterator rather than a page list
      cifs: Make cifs_writepages() hand an iterator down
      cifs: Make cifs_readahead() pass an iterator down
      cifs: Get direct I/O and unbuffered I/O working with iterators
      cifs: Use netfslib to handle reads


 fs/cifs/Kconfig        |    1 +
 fs/cifs/cifsencrypt.c  |   40 +-
 fs/cifs/cifsfs.c       |    8 +-
 fs/cifs/cifsfs.h       |    6 +-
 fs/cifs/cifsglob.h     |   34 +-
 fs/cifs/cifsproto.h    |   11 +-
 fs/cifs/cifssmb.c      |  233 +++--
 fs/cifs/connect.c      |   18 +-
 fs/cifs/file.c         | 1930 ++++++++++------------------------------
 fs/cifs/fscache.c      |   31 -
 fs/cifs/fscache.h      |   52 --
 fs/cifs/inode.c        |   17 +-
 fs/cifs/misc.c         |  109 ---
 fs/cifs/smb2ops.c      |  365 ++++----
 fs/cifs/smb2pdu.c      |   27 +-
 fs/cifs/transport.c    |   37 +-
 fs/netfs/read_helper.c |    7 +-
 17 files changed, 888 insertions(+), 2038 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

