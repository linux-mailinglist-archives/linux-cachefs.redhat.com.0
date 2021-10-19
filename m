Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AA9433DCB
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Oct 2021 19:50:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-LX0KmgU3Peie3TkR1UgG4g-1; Tue, 19 Oct 2021 13:50:42 -0400
X-MC-Unique: LX0KmgU3Peie3TkR1UgG4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD8B680A5F1;
	Tue, 19 Oct 2021 17:50:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F72F1045D02;
	Tue, 19 Oct 2021 17:50:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BFBB1800FE4;
	Tue, 19 Oct 2021 17:50:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19JHoZsg017595 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 19 Oct 2021 13:50:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F1986101043F; Tue, 19 Oct 2021 17:50:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED0E3101043E
	for <linux-cachefs@redhat.com>; Tue, 19 Oct 2021 17:50:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C20C1066682
	for <linux-cachefs@redhat.com>; Tue, 19 Oct 2021 17:50:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-306-JvGJsByuOYyD5X4a7yIOxA-1;
	Tue, 19 Oct 2021 13:50:28 -0400
X-MC-Unique: JvGJsByuOYyD5X4a7yIOxA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A89D60FE8;
	Tue, 19 Oct 2021 17:50:25 +0000 (UTC)
Message-ID: <67f55d920f40bf6c49643af08fe8a5cfc97a9542.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Tue, 19 Oct 2021 13:50:24 -0400
In-Reply-To: <163456871794.2614702.15398637170877934146.stgit@warthog.procyon.org.uk>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
	<163456871794.2614702.15398637170877934146.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org, Trond, Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Ilya Dryomov <idryomov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Omar Sandoval <osandov@osandov.com>
Subject: Re: [Linux-cachefs] [PATCH 06/67] nfs, cifs, ceph,
 9p: Disable use of fscache prior to its rewrite
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-10-18 at 15:51 +0100, David Howells wrote:
> Temporarily disable the use of fscache by the various Linux network
> filesystems, apart from afs, so that the fscache core can be rewritten.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Dave Wysochanski <dwysocha@redhat.com>
> cc: Trond Myklebust <trond.myklebust@hammerspace.com>
> cc: Anna Schumaker <anna.schumaker@netapp.com>
> cc: linux-nfs@vger.kernel.org
> cc: Jeff Layton <jlayton@kernel.org>
> cc: Ilya Dryomov <idryomov@gmail.com>
> cc: ceph-devel@vger.kernel.org
> cc: Steve French <sfrench@samba.org>
> cc: linux-cifs@vger.kernel.org
> cc: Eric Van Hensbergen <ericvh@gmail.com>
> cc: Latchesar Ionkov <lucho@ionkov.net>
> cc: Dominique Martinet <asmadeus@codewreck.org>
> cc: v9fs-developer@lists.sourceforge.net
> ---
> 
>  fs/9p/Kconfig      |    2 +-
>  fs/ceph/Kconfig    |    2 +-
>  fs/cifs/Kconfig    |    2 +-
>  fs/fscache/Kconfig |    4 ++++
>  fs/nfs/Kconfig     |    2 +-
>  5 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/9p/Kconfig b/fs/9p/Kconfig
> index d7bc93447c85..b11c15c30bac 100644
> --- a/fs/9p/Kconfig
> +++ b/fs/9p/Kconfig
> @@ -14,7 +14,7 @@ config 9P_FS
>  if 9P_FS
>  config 9P_FSCACHE
>  	bool "Enable 9P client caching support"
> -	depends on 9P_FS=m && FSCACHE || 9P_FS=y && FSCACHE=y
> +	depends on 9P_FS=m && FSCACHE_OLD || 9P_FS=y && FSCACHE_OLD=y
>  	help
>  	  Choose Y here to enable persistent, read-only local
>  	  caching support for 9p clients using FS-Cache
> diff --git a/fs/ceph/Kconfig b/fs/ceph/Kconfig
> index 94df854147d3..77ad452337ee 100644
> --- a/fs/ceph/Kconfig
> +++ b/fs/ceph/Kconfig
> @@ -21,7 +21,7 @@ config CEPH_FS
>  if CEPH_FS
>  config CEPH_FSCACHE
>  	bool "Enable Ceph client caching support"
> -	depends on CEPH_FS=m && FSCACHE || CEPH_FS=y && FSCACHE=y
> +	depends on CEPH_FS=m && FSCACHE_OLD || CEPH_FS=y && FSCACHE_OLD=y
>  	help
>  	  Choose Y here to enable persistent, read-only local
>  	  caching support for Ceph clients using FS-Cache
> diff --git a/fs/cifs/Kconfig b/fs/cifs/Kconfig
> index 3b7e3b9e4fd2..c5477abbcff0 100644
> --- a/fs/cifs/Kconfig
> +++ b/fs/cifs/Kconfig
> @@ -188,7 +188,7 @@ config CIFS_SMB_DIRECT
>  
>  config CIFS_FSCACHE
>  	bool "Provide CIFS client caching support"
> -	depends on CIFS=m && FSCACHE || CIFS=y && FSCACHE=y
> +	depends on CIFS=m && FSCACHE_OLD || CIFS=y && FSCACHE_OLD=y
>  	help
>  	  Makes CIFS FS-Cache capable. Say Y here if you want your CIFS data
>  	  to be cached locally on disk through the general filesystem cache
> diff --git a/fs/fscache/Kconfig b/fs/fscache/Kconfig
> index b313a978ae0a..7850de3bdee0 100644
> --- a/fs/fscache/Kconfig
> +++ b/fs/fscache/Kconfig
> @@ -38,3 +38,7 @@ config FSCACHE_DEBUG
>  	  enabled by setting bits in /sys/modules/fscache/parameter/debug.
>  
>  	  See Documentation/filesystems/caching/fscache.rst for more information.
> +
> +config FSCACHE_OLD
> +	bool
> +	default n
> diff --git a/fs/nfs/Kconfig b/fs/nfs/Kconfig
> index 14a72224b657..a8b73c90aa00 100644
> --- a/fs/nfs/Kconfig
> +++ b/fs/nfs/Kconfig
> @@ -170,7 +170,7 @@ config ROOT_NFS
>  
>  config NFS_FSCACHE
>  	bool "Provide NFS client caching support"
> -	depends on NFS_FS=m && FSCACHE || NFS_FS=y && FSCACHE=y
> +	depends on NFS_FS=m && FSCACHE_OLD || NFS_FS=y && FSCACHE_OLD=y
>  	help
>  	  Say Y here if you want NFS data to be cached locally on disc through
>  	  the general filesystem cache manager
> 
> 

The typical way to do this would be to rebrand the existing FSCACHE
Kconfig symbols into FSCACHE_OLD and then build the new fscache
structure such that it exists in parallel with the old. You'd then just
drop the old infrastructure once all of the fs's are converted to the
new. You could even make them conflict with one another in Kconfig too,
so that only one could be built in during the transition period if
supporting both at runtime is too difficult.

This approach of disabling everything is much more of an all-or-nothing
affair. It may mean less "churn" overall, but it seems less "nice"
because you have an interval of commits where fscache is non-functional.

I'm not necessarily opposed to this approach, but I'd like to better
understand why doing it this way was preferred.
-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

