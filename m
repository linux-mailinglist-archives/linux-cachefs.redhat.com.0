Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB1749E6E0
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Jan 2022 17:02:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643299370;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5EIPCbmX/ANdZOfe3Vrwg4KwyE1RhBB/BRtLKYvAkdE=;
	b=hDaPq6Bm8hgygDg44YAHFc7qUZ0Aq8oCtVhIoAYa9RBzKGdUxpjhwpkfeOaZ0BZG6bzyAg
	Efu42TH/yX62KgTf/4SdigL7fBuAWhuIM4zcmGnZ7BNfnrOK4ABbb+CQa5lL1KCDQzpFkU
	fQVWIYEQKbMny3LNgxZeO/v76oR6U00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-MtVFPkZ3MQSMH0Xidq4ybQ-1; Thu, 27 Jan 2022 11:02:42 -0500
X-MC-Unique: MtVFPkZ3MQSMH0Xidq4ybQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2F1A100CCC1;
	Thu, 27 Jan 2022 16:02:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A68F122DEF;
	Thu, 27 Jan 2022 16:02:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF4FE4BB7C;
	Thu, 27 Jan 2022 16:02:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20RG2SQU014292 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 27 Jan 2022 11:02:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C7A968276B; Thu, 27 Jan 2022 16:02:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99021838C4;
	Thu, 27 Jan 2022 16:01:42 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Steve French <smfrench@gmail.com>
Date: Thu, 27 Jan 2022 16:01:41 +0000
Message-ID: <164329930161.843658.7387773437540491743.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [Linux-cachefs] [PATCH 0/4] cifs: Use fscache I/O again after the
	rewrite disabled it
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


Hi Steve,

Here are some patches to make cifs actually do I/O to the cache after it
got disabled in the fscache rewrite[1] plus a warning fix that you might
want to detach and take separately:

 (1) Fix a kernel doc warning.

 (2) Change cifs from using ->readpages() to using ->readahead().

 (3) Provide a netfs cache op to query for the presence of data in the
     cache.[*]

 (4) Make ->readahead() call

The patches can be found here also:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-rewrite

David

[*] Ideally, we would use the netfslib read helpers, but it's probably better
    to roll iterators down into cifs's I/O layer before doing that[2].

Link: https://lore.kernel.org/r/164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk/ [1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=cifs-experimental [2]

---
David Howells (4):
      Fix a warning about a malformed kernel doc comment in cifs by removing the
      cifs: Transition from ->readpages() to ->readahead()
      netfs, cachefiles: Add a method to query presence of data in the cache
      cifs: Implement cache I/O by accessing the cache directly


 Documentation/filesystems/netfs_library.rst |  16 ++
 fs/cachefiles/io.c                          |  59 ++++++
 fs/cifs/connect.c                           |   2 +-
 fs/cifs/file.c                              | 221 ++++++++------------
 fs/cifs/fscache.c                           | 126 +++++++++--
 fs/cifs/fscache.h                           |  79 ++++---
 include/linux/netfs.h                       |   7 +
 7 files changed, 322 insertions(+), 188 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

