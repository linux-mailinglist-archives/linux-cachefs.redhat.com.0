Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6C140B32D
	for <lists+linux-cachefs@lfdr.de>; Tue, 14 Sep 2021 17:32:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631633539;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3k3RF4D6jXtYZDR9J1kKjlSaR8x/rVkoiWc6CsPeWDk=;
	b=J6Bajfxg7uhEKOcpbLZiZUUIbwiGFEiABIEIabbX52wCUeWG2+O+XTfuwincAuYD3zE7uD
	jTb7ScLaIpSA27c8GrVw54ax44y+zLOUgzoS55ijgsZCJgtx2VV5llvx1u9F1I7TdcrKQV
	uDNHWT+2M9p7kJQ69chOZAxhBYz+1Zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-jpQao7iPMP2JW1JWADDAEw-1; Tue, 14 Sep 2021 11:32:18 -0400
X-MC-Unique: jpQao7iPMP2JW1JWADDAEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 537368E5386;
	Tue, 14 Sep 2021 15:31:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18BAD6A257;
	Tue, 14 Sep 2021 15:31:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11E054EA2A;
	Tue, 14 Sep 2021 15:31:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18EFVHZ3026063 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 14 Sep 2021 11:31:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0393FD74BC; Tue, 14 Sep 2021 15:31:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF88CD74C6
	for <linux-cachefs@redhat.com>; Tue, 14 Sep 2021 15:31:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9865291C7D9
	for <linux-cachefs@redhat.com>; Tue, 14 Sep 2021 15:31:12 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
	[209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-199-4k4jYdZPMAecn1gUMtVxWA-1; Tue, 14 Sep 2021 11:31:10 -0400
X-MC-Unique: 4k4jYdZPMAecn1gUMtVxWA-1
Received: by mail-ej1-f69.google.com with SMTP id
	bi9-20020a170906a24900b005c74b30ff24so5579491ejb.5
	for <linux-cachefs@redhat.com>; Tue, 14 Sep 2021 08:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=28uHVFlIgd259Tk0Onl6nVW85p5Wip9eeWyZFWWQ7Gw=;
	b=dda0H8GdZKnJY0Gu2Q4ART0mZjJBlTQClgY6LUHH9fLQAO/7V9Vl+EIkmADyIpZenb
	tjgA3vgf1JVNipqZ54u52OJpJQpWMcssk2IEjKEPWhoMCMamuYAzw0/rRnt91jV19iC8
	QE4jlDcVCzewQAaFWE8iaBU5EligNRHvU+AovnpXprXIPM/nLbxRDthZQlwV+2tSC8H9
	gjKx2TfaWBrmYyH84PakQO9hJoB3+p4gmyyVQNQnt9zD3UAamLnvkp207fu5CcLcAKtO
	VapBsc0hNYDvBEISi81ahdbp1PvZaN4V+yAtoESzo9p0/Wy/KU1v9AQUvf33LKIdClwa
	k/4A==
X-Gm-Message-State: AOAM533YwKEPPCBmCXHc6lBoK+j35ladNgQJ2k3DUV4ifJi7siib7FR9
	YAjG7KrvKG5JjmniI8V3p0QRg+53ExqMJtcwER5IeTjd9OG4a5ZXrD15dp7Uv89nZbsoaW0WJlQ
	NFaMPC6V//IhycKjErPyWw6xag2ehReUoMFsRpA==
X-Received: by 2002:a17:907:9602:: with SMTP id
	gb2mr19741334ejc.119.1631633467709; 
	Tue, 14 Sep 2021 08:31:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBCsPMH/stPuTNHWIjWdIDFCeRDqb2JZpOnn0wdJ4EAfdOma5ARu4H6YXdUtlU3P33pyF7rZaoQLtYtlKQ92E=
X-Received: by 2002:a17:907:9602:: with SMTP id
	gb2mr19741147ejc.119.1631633465397; 
	Tue, 14 Sep 2021 08:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <163162767601.438332.9017034724960075707.stgit@warthog.procyon.org.uk>
In-Reply-To: <163162767601.438332.9017034724960075707.stgit@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Tue, 14 Sep 2021 11:30:29 -0400
Message-ID: <CALF+zO=VHPzcp0A0KxpYW-0WnyxvM5gW5HmorzrMJ_arxxBchA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 14, 2021 at 9:55 AM David Howells <dhowells@redhat.com> wrote:
>
>
> Here's a set of patches that removes the old fscache I/O API by the following
> means:
>
>  (1) A simple fallback API is added that can read or write a single page
>      synchronously.  The functions for this have "deprecated" in their names
>      as they have to be removed at some point.
>
>  (2) An implementation of this is provided in cachefiles.  It creates a kiocb
>      to use DIO to the backing file rather than calling readpage on the
>      backing filesystem page and then snooping the page wait queue.
>
>  (3) NFS is switched to use the fallback API.
>
>  (4) CIFS is switched to use the fallback API also for the moment.
>
>  (5) 9P is switched to using netfslib.
>
>  (6) The old I/O API is removed from fscache and the page snooping
>      implementation is removed from cachefiles.
>
> The reasons for doing this are:
>
>  (A) Using a kiocb to do asynchronous DIO from/to the pages of the backing
>      file is now a possibility that didn't exist when cachefiles was created.
>      This is much simpler than the snooping mechanism with a proper callback
>      path and it also requires fewer copies and less memory.
>
>  (B) We have to stop using bmap() or SEEK_DATA/SEEK_HOLE to work out what
>      blocks are present in the backing file is dangerous and can lead to data
>      corruption if the backing filesystem can insert or remove blocks of zeros
>      arbitrarily in order to optimise its extent list[1].
>
>      Whilst this patchset doesn't fix that yet, it does simplify the code and
>      the fix for that can be made in a subsequent patchset.
>
>  (C) In order to fix (B), the cache will need to keep track itself of what
>      data is present.  To make this easier to manage, the intention is to
>      increase the cache block granularity to, say, 256KiB - importantly, a
>      size that will span multiple pages - which means the single-page
>      interface will have to go away.  netfslib is designed to deal with
>      that on behalf of a filesystem, though a filesystem could use raw
>      cache calls instead and manage things itself.
>
> These patches can be found also on:
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-iter-3
>
> David
>
> Link: https://lore.kernel.org/r/YO17ZNOcq+9PajfQ@mit.edu [1]
> ---
> David Howells (8):
>       fscache: Generalise the ->begin_read_operation method
>       fscache: Implement an alternate I/O interface to replace the old API
>       nfs: Move to using the alternate (deprecated) fscache I/O API
>       9p: (untested) Convert to using the netfs helper lib to do reads and caching
>       cifs: (untested) Move to using the alternate (deprecated) fscache I/O API
>       fscache: Remove the old I/O API
>       fscache: Remove stats that are no longer used
>       fscache: Update the documentation to reflect I/O API changes
>
>
>  .../filesystems/caching/backend-api.rst       |  138 +--
>  .../filesystems/caching/netfs-api.rst         |  386 +-----
>  fs/9p/Kconfig                                 |    1 +
>  fs/9p/cache.c                                 |  137 ---
>  fs/9p/cache.h                                 |   98 +-
>  fs/9p/v9fs.h                                  |    9 +
>  fs/9p/vfs_addr.c                              |  174 ++-
>  fs/9p/vfs_file.c                              |   21 +-
>  fs/cachefiles/Makefile                        |    1 -
>  fs/cachefiles/interface.c                     |   15 -
>  fs/cachefiles/internal.h                      |   38 -
>  fs/cachefiles/io.c                            |   28 +-
>  fs/cachefiles/main.c                          |    1 -
>  fs/cachefiles/rdwr.c                          |  972 ---------------
>  fs/cifs/file.c                                |   64 +-
>  fs/cifs/fscache.c                             |  105 +-
>  fs/cifs/fscache.h                             |   74 +-
>  fs/fscache/cache.c                            |    6 -
>  fs/fscache/cookie.c                           |   10 -
>  fs/fscache/internal.h                         |   58 +-
>  fs/fscache/io.c                               |  140 ++-
>  fs/fscache/object.c                           |    2 -
>  fs/fscache/page.c                             | 1066 -----------------
>  fs/fscache/stats.c                            |   73 +-
>  fs/nfs/file.c                                 |   14 +-
>  fs/nfs/fscache-index.c                        |   26 -
>  fs/nfs/fscache.c                              |  161 +--
>  fs/nfs/fscache.h                              |   84 +-
>  fs/nfs/read.c                                 |   25 +-
>  fs/nfs/write.c                                |    7 +-
>  include/linux/fscache-cache.h                 |  131 --
>  include/linux/fscache.h                       |  418 ++-----
>  include/linux/netfs.h                         |   17 +-
>  33 files changed, 508 insertions(+), 3992 deletions(-)
>  delete mode 100644 fs/cachefiles/rdwr.c
>
>

I tested an earlier version of these with NFS, which identified a
couple issues which you fixed.  Last I checked my unit tests and
xfstests were looking good. I'll do some testing on this latest branch
/ patches and report back.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

