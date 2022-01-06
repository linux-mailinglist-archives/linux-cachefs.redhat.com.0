Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B353F486729
	for <lists+linux-cachefs@lfdr.de>; Thu,  6 Jan 2022 16:55:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-2htKLqK2P7GrLz6teaGHQw-1; Thu, 06 Jan 2022 10:55:35 -0500
X-MC-Unique: 2htKLqK2P7GrLz6teaGHQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 416E91015DA0;
	Thu,  6 Jan 2022 15:55:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3549477443;
	Thu,  6 Jan 2022 15:55:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1B8F4BB7C;
	Thu,  6 Jan 2022 15:55:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 206FtOYr001091 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 6 Jan 2022 10:55:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E2CCC200AFD4; Thu,  6 Jan 2022 15:55:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE8992026D07
	for <linux-cachefs@redhat.com>; Thu,  6 Jan 2022 15:55:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E67F43C11A2E
	for <linux-cachefs@redhat.com>; Thu,  6 Jan 2022 15:55:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
	[139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-479-9H1H5bbbOoepJoUC6pt7tg-1; Thu, 06 Jan 2022 10:55:17 -0500
X-MC-Unique: 9H1H5bbbOoepJoUC6pt7tg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D39D61CBB;
	Thu,  6 Jan 2022 15:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA9EC36AED;
	Thu,  6 Jan 2022 15:55:14 +0000 (UTC)
Message-ID: <043a206f03929c2667a465314144e518070a9b2d.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Thu, 06 Jan 2022 10:55:12 -0500
In-Reply-To: <164021525963.640689.9264556596205140044.stgit@warthog.procyon.org.uk>
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
	<164021525963.640689.9264556596205140044.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
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
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, Dominique,
	Torvalds <torvalds@linux-foundation.org>,
	Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net,
	Omar Sandoval <osandov@osandov.com>, Linus,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 28/68] fscache: Provide a function to
 note the release of a page
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2021-12-22 at 23:20 +0000, David Howells wrote:
> Provide a function to be called from a network filesystem's releasepage
> method to indicate that a page has been released that might have been a
> reflection of data upon the server - and now that data must be reloaded
> from the server or the cache.
> 
> This is used to end an optimisation for empty files, in particular files
> that have just been created locally, whereby we know there cannot yet be
> any data that we would need to read from the server or the cache.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com
> Link: https://lore.kernel.org/r/163819617128.215744.4725572296135656508.stgit@warthog.procyon.org.uk/ # v1
> Link: https://lore.kernel.org/r/163906920354.143852.7511819614661372008.stgit@warthog.procyon.org.uk/ # v2
> Link: https://lore.kernel.org/r/163967128061.1823006.611781655060034988.stgit@warthog.procyon.org.uk/ # v3
> ---
> 
>  include/linux/fscache.h |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/linux/fscache.h b/include/linux/fscache.h
> index 18e725671594..28ce258c1f87 100644
> --- a/include/linux/fscache.h
> +++ b/include/linux/fscache.h
> @@ -607,4 +607,20 @@ static inline void fscache_clear_inode_writeback(struct fscache_cookie *cookie,
>  	}
>  }
>  
> +/**
> + * fscache_note_page_release - Note that a netfs page got released
> + * @cookie: The cookie corresponding to the file
> + *
> + * Note that a page that has been copied to the cache has been released.  This
> + * means that future reads will need to look in the cache to see if it's there.
> + */
> +static inline
> +void fscache_note_page_release(struct fscache_cookie *cookie)
> +{
> +	if (cookie &&
> +	    test_bit(FSCACHE_COOKIE_HAVE_DATA, &cookie->flags) &&
> +	    test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags))
> +		clear_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
> +}
> +
>  #endif /* _LINUX_FSCACHE_H */
> 
> 

Is this logic correct?

FSCACHE_COOKIE_HAVE_DATA gets set in cachefiles_write_complete, but will
that ever be called on a cookie that has no data? Will we ever call
cachefiles_write at all when there is no data to be written?

--
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

