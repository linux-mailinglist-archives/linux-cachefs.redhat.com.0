Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A9449F7B8
	for <lists+linux-cachefs@lfdr.de>; Fri, 28 Jan 2022 11:58:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-iOgsyBXaPlm3CAHCIZUChw-1; Fri, 28 Jan 2022 05:58:37 -0500
X-MC-Unique: iOgsyBXaPlm3CAHCIZUChw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB4021006AA4;
	Fri, 28 Jan 2022 10:58:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D51001F45F;
	Fri, 28 Jan 2022 10:58:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B0DC1809CB8;
	Fri, 28 Jan 2022 10:58:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20SAwRCw003532 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 28 Jan 2022 05:58:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1F69BC1914B; Fri, 28 Jan 2022 10:58:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BA43C1914A
	for <linux-cachefs@redhat.com>; Fri, 28 Jan 2022 10:58:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0156A1C01340
	for <linux-cachefs@redhat.com>; Fri, 28 Jan 2022 10:58:27 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-172-wOdIQnCuOg-KttHcA680mQ-1; Fri, 28 Jan 2022 05:58:25 -0500
X-MC-Unique: wOdIQnCuOg-KttHcA680mQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B6809B81D4E;
	Fri, 28 Jan 2022 10:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF14CC340E0;
	Fri, 28 Jan 2022 10:58:21 +0000 (UTC)
Message-ID: <e5bee4a3e8a7c860d447fe74d5cf2d1846e8600d.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, Steve French <smfrench@gmail.com>
Date: Fri, 28 Jan 2022 05:58:20 -0500
In-Reply-To: <164329930161.843658.7387773437540491743.stgit@warthog.procyon.org.uk>
References: <164329930161.843658.7387773437540491743.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
	Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Linus
Subject: Re: [Linux-cachefs] [PATCH 0/4] cifs: Use fscache I/O again after
 the rewrite disabled it
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

On Thu, 2022-01-27 at 16:01 +0000, David Howells wrote:
> Hi Steve,
> 
> Here are some patches to make cifs actually do I/O to the cache after it
> got disabled in the fscache rewrite[1] plus a warning fix that you might
> want to detach and take separately:
> 
>  (1) Fix a kernel doc warning.
> 
>  (2) Change cifs from using ->readpages() to using ->readahead().
> 
>  (3) Provide a netfs cache op to query for the presence of data in the
>      cache.[*]
> 
>  (4) Make ->readahead() call
> 
> The patches can be found here also:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-rewrite
> 
> David
> 
> [*] Ideally, we would use the netfslib read helpers, but it's probably better
>     to roll iterators down into cifs's I/O layer before doing that[2].
> 
> Link: https://lore.kernel.org/r/164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk/ [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=cifs-experimental [2]
> 
> ---
> David Howells (4):
>       Fix a warning about a malformed kernel doc comment in cifs by removing the
>       cifs: Transition from ->readpages() to ->readahead()
>       netfs, cachefiles: Add a method to query presence of data in the cache
>       cifs: Implement cache I/O by accessing the cache directly
> 
> 
>  Documentation/filesystems/netfs_library.rst |  16 ++
>  fs/cachefiles/io.c                          |  59 ++++++
>  fs/cifs/connect.c                           |   2 +-
>  fs/cifs/file.c                              | 221 ++++++++------------
>  fs/cifs/fscache.c                           | 126 +++++++++--
>  fs/cifs/fscache.h                           |  79 ++++---
>  include/linux/netfs.h                       |   7 +
>  7 files changed, 322 insertions(+), 188 deletions(-)
> 
> 

Acked-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

