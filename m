Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B3E65411522
	for <lists+linux-cachefs@lfdr.de>; Mon, 20 Sep 2021 15:00:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632142807;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/fPlumA+9CPPJSoiVZ8zQoarkGr+dqULcco0wbwQH1M=;
	b=iEleMg+KerzbcGAvKBjBXGbLLoS2GKaTY0dD4JloNdyNxkTUgraSIpO8mzAxOYJdDmmt4w
	dBUdiS/Cx7nnPuDVRx5auKKqrl0Lxtm3UteaTduVxCUl0ftUwuvSjqCF54pWqwxz7E0cpX
	7VemVAthV/jB1zsv0YJXi1OnQOPA/O0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-DdmMfvKAOem6Ji89JyF6EA-1; Mon, 20 Sep 2021 09:00:06 -0400
X-MC-Unique: DdmMfvKAOem6Ji89JyF6EA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE7F8835DE2;
	Mon, 20 Sep 2021 13:00:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDD6B60C17;
	Mon, 20 Sep 2021 13:00:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D91F1809C84;
	Mon, 20 Sep 2021 12:59:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18KCtcF3004357 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 20 Sep 2021 08:55:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FC77200D8D5; Mon, 20 Sep 2021 12:55:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27C2B200D8CA
	for <linux-cachefs@redhat.com>; Mon, 20 Sep 2021 12:55:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D741D899EDE
	for <linux-cachefs@redhat.com>; Mon, 20 Sep 2021 12:55:34 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
	[209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-329-Q3n6pFmSOoSk7ZP7Ys8MvA-1; Mon, 20 Sep 2021 08:55:33 -0400
X-MC-Unique: Q3n6pFmSOoSk7ZP7Ys8MvA-1
Received: by mail-ed1-f72.google.com with SMTP id
	ec14-20020a0564020d4e00b003cf5630c190so15639496edb.3
	for <linux-cachefs@redhat.com>; Mon, 20 Sep 2021 05:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2pfCQSUTEHtxvGUE7L+msEadtTL5UoS3j8kSdpaAr2M=;
	b=TpfJbPUg+6NU/Khr1df7mpi5FKh6X9LumY9cIOh59AEiyV5+9jf0EfUQqIdnjq+nVT
	PqUUPla+RQYl3VPGzOMv/E4vDiOD2Xqep7MB4zu8y2QJcKMUn5gMMMOjGmYKUdmS9RDM
	/3F7YSRRsQia/DdHOmMVJ7Jh2MordTFsEZIS5NyekhvuSxsXi6TxRuCqd3DM9cJ2i30C
	jG1pinEljhg4fGFvIDiB6+UviUYN+MNOG8karJKuifD+PNA+7TIfqrFQ+shLi+BwfRCe
	cb8dWk+pF+yKCz9NrKJBkmfoNuX41NHkfPA1N8Sr+XNOpFDEbLkmgyaBDCV/oGAKGDCM
	znRg==
X-Gm-Message-State: AOAM532b3hjwv66WlQ4XxsL6+PAzEEQvP0tfqFZXYfsSA9m3v+WGEXz6
	htOfmIHcVa4bRsrgcfXt3RvjZ2eqtl3QIHD3agYLGHj9pb2xE5Lht/UBu6LEU0gw3jrJOQpL3nr
	iyttKK57vklUHEnSOVn4/6q1/GdAalEVwk0+0Sg==
X-Received: by 2002:a05:6402:897:: with SMTP id
	e23mr29275321edy.366.1632142532342; 
	Mon, 20 Sep 2021 05:55:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlDFvRn78rkRZA594LdXUAWQmcz2jxyF/fehBHkaHwnv53x2WQ0in/WyUSP9JJllei7jnYtq334xLMF93TdIE=
X-Received: by 2002:a05:6402:897:: with SMTP id
	e23mr29275298edy.366.1632142532147; 
	Mon, 20 Sep 2021 05:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <163162767601.438332.9017034724960075707.stgit@warthog.procyon.org.uk>
	<CALF+zO=VHPzcp0A0KxpYW-0WnyxvM5gW5HmorzrMJ_arxxBchA@mail.gmail.com>
In-Reply-To: <CALF+zO=VHPzcp0A0KxpYW-0WnyxvM5gW5HmorzrMJ_arxxBchA@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Mon, 20 Sep 2021 08:54:56 -0400
Message-ID: <CALF+zOkz8M_uwJRK_q=TVANrF=0=W2WAbL2Y-JBDrq2ZuRpcDg@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>,
	linux-cifs <linux-cifs@vger.kernel.org>,
	linux-nfs <linux-nfs@vger.kernel.org>, linux-afs@lists.infradead.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Steve French <sfrench@samba.org>, linux-cachefs <linux-cachefs@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [RFC PATCH 0/8] fscache: Replace and remove old
	I/O API
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

On Tue, Sep 14, 2021 at 11:30 AM David Wysochanski <dwysocha@redhat.com> wrote:
>
> On Tue, Sep 14, 2021 at 9:55 AM David Howells <dhowells@redhat.com> wrote:
> >
> >
> > Here's a set of patches that removes the old fscache I/O API by the following
> > means:
> >
> >  (1) A simple fallback API is added that can read or write a single page
> >      synchronously.  The functions for this have "deprecated" in their names
> >      as they have to be removed at some point.
> >
> >  (2) An implementation of this is provided in cachefiles.  It creates a kiocb
> >      to use DIO to the backing file rather than calling readpage on the
> >      backing filesystem page and then snooping the page wait queue.
> >
> >  (3) NFS is switched to use the fallback API.
> >
> >  (4) CIFS is switched to use the fallback API also for the moment.
> >
> >  (5) 9P is switched to using netfslib.
> >
> >  (6) The old I/O API is removed from fscache and the page snooping
> >      implementation is removed from cachefiles.
> >
> > The reasons for doing this are:
> >
> >  (A) Using a kiocb to do asynchronous DIO from/to the pages of the backing
> >      file is now a possibility that didn't exist when cachefiles was created.
> >      This is much simpler than the snooping mechanism with a proper callback
> >      path and it also requires fewer copies and less memory.
> >
> >  (B) We have to stop using bmap() or SEEK_DATA/SEEK_HOLE to work out what
> >      blocks are present in the backing file is dangerous and can lead to data
> >      corruption if the backing filesystem can insert or remove blocks of zeros
> >      arbitrarily in order to optimise its extent list[1].
> >
> >      Whilst this patchset doesn't fix that yet, it does simplify the code and
> >      the fix for that can be made in a subsequent patchset.
> >
> >  (C) In order to fix (B), the cache will need to keep track itself of what
> >      data is present.  To make this easier to manage, the intention is to
> >      increase the cache block granularity to, say, 256KiB - importantly, a
> >      size that will span multiple pages - which means the single-page
> >      interface will have to go away.  netfslib is designed to deal with
> >      that on behalf of a filesystem, though a filesystem could use raw
> >      cache calls instead and manage things itself.
> >
> > These patches can be found also on:
> >
> >         https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-iter-3
> >
> > David
> >
> > Link: https://lore.kernel.org/r/YO17ZNOcq+9PajfQ@mit.edu [1]
> > ---
> > David Howells (8):
> >       fscache: Generalise the ->begin_read_operation method
> >       fscache: Implement an alternate I/O interface to replace the old API
> >       nfs: Move to using the alternate (deprecated) fscache I/O API
> >       9p: (untested) Convert to using the netfs helper lib to do reads and caching
> >       cifs: (untested) Move to using the alternate (deprecated) fscache I/O API
> >       fscache: Remove the old I/O API
> >       fscache: Remove stats that are no longer used
> >       fscache: Update the documentation to reflect I/O API changes
> >
> >
> >  .../filesystems/caching/backend-api.rst       |  138 +--
> >  .../filesystems/caching/netfs-api.rst         |  386 +-----
> >  fs/9p/Kconfig                                 |    1 +
> >  fs/9p/cache.c                                 |  137 ---
> >  fs/9p/cache.h                                 |   98 +-
> >  fs/9p/v9fs.h                                  |    9 +
> >  fs/9p/vfs_addr.c                              |  174 ++-
> >  fs/9p/vfs_file.c                              |   21 +-
> >  fs/cachefiles/Makefile                        |    1 -
> >  fs/cachefiles/interface.c                     |   15 -
> >  fs/cachefiles/internal.h                      |   38 -
> >  fs/cachefiles/io.c                            |   28 +-
> >  fs/cachefiles/main.c                          |    1 -
> >  fs/cachefiles/rdwr.c                          |  972 ---------------
> >  fs/cifs/file.c                                |   64 +-
> >  fs/cifs/fscache.c                             |  105 +-
> >  fs/cifs/fscache.h                             |   74 +-
> >  fs/fscache/cache.c                            |    6 -
> >  fs/fscache/cookie.c                           |   10 -
> >  fs/fscache/internal.h                         |   58 +-
> >  fs/fscache/io.c                               |  140 ++-
> >  fs/fscache/object.c                           |    2 -
> >  fs/fscache/page.c                             | 1066 -----------------
> >  fs/fscache/stats.c                            |   73 +-
> >  fs/nfs/file.c                                 |   14 +-
> >  fs/nfs/fscache-index.c                        |   26 -
> >  fs/nfs/fscache.c                              |  161 +--
> >  fs/nfs/fscache.h                              |   84 +-
> >  fs/nfs/read.c                                 |   25 +-
> >  fs/nfs/write.c                                |    7 +-
> >  include/linux/fscache-cache.h                 |  131 --
> >  include/linux/fscache.h                       |  418 ++-----
> >  include/linux/netfs.h                         |   17 +-
> >  33 files changed, 508 insertions(+), 3992 deletions(-)
> >  delete mode 100644 fs/cachefiles/rdwr.c
> >
> >
>
> I tested an earlier version of these with NFS, which identified a
> couple issues which you fixed.  Last I checked my unit tests and
> xfstests were looking good. I'll do some testing on this latest branch
> / patches and report back.

For the series, you can add
Tested-by: Dave Wysochanski <dwysocha@redhat.com>

Testing was limited to NFS enabled code paths.  I ran custom unit
tests, as well as a series of xfstest generic runs with various NFS
versions, both fscache enabled and not enabled, as well as various NFS
servers, comparing 5.15.0-rc1 runs vs runs with these patches.  I did
not see any failures with these new patches that were not already
present with 5.15.0-rc1.

Here are the list of xfstest generic runs:
1. Hammerspace (pNFS flexfiles) version 4.6.3-166: vers=4.1,fsc
2. Hammerspace (pNFS flexfiles) version 4.6.3-166: vers=4.2
3. Netapp (pNFS filelayout) version 9.5RC1: vers=4.1
4. Netapp (pNFS filelayout) version 9.5RC1: vers=4.1,fsc
5. Red Hat version 8.2 (kernel-4.18.0-193.el8): vers=4.2,fsc
6. Red Hat version 8.2 (kernel-4.18.0-193.el8): vers=4.0,fsc
7. Red Hat version 8.2 (kernel-4.18.0-193.el8): vers=3,fsc

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

