Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DA24D37FA6A
	for <lists+linux-cachefs@lfdr.de>; Thu, 13 May 2021 17:15:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-2bBt8xHMOiOc2GPqTB0KeA-1; Thu, 13 May 2021 11:15:01 -0400
X-MC-Unique: 2bBt8xHMOiOc2GPqTB0KeA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D149107ACC7;
	Thu, 13 May 2021 15:14:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B17E19C59;
	Thu, 13 May 2021 15:14:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC6E018005B6;
	Thu, 13 May 2021 15:14:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14DFEur8024056 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 13 May 2021 11:14:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B84E21EE570; Thu, 13 May 2021 15:14:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75A3221EE572
	for <linux-cachefs@redhat.com>; Thu, 13 May 2021 15:14:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B5E5185A79C
	for <linux-cachefs@redhat.com>; Thu, 13 May 2021 15:14:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-553-M2vVpCrKOySQMdnEL0x08A-1;
	Thu, 13 May 2021 11:14:48 -0400
X-MC-Unique: M2vVpCrKOySQMdnEL0x08A-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8501C61406;
	Thu, 13 May 2021 15:14:46 +0000 (UTC)
Message-ID: <69b577faaff376bde047edb9dfbda0b770ab0ca4.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, geert@linux-m68k.org
Date: Thu, 13 May 2021 11:14:45 -0400
In-Reply-To: <162090298141.3166007.2971118149366779916.stgit@warthog.procyon.org.uk>
References: <162090298141.3166007.2971118149366779916.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: Make CONFIG_NETFS_SUPPORT
 auto-selected rather than manual
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

On Thu, 2021-05-13 at 11:49 +0100, David Howells wrote:
> Make the netfs helper library selected automatically by the things that use
> it rather than being manually configured, even though it's required.
> 
> Fixes: 3a5829fefd3b ("netfs: Make a netfs helper module")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-mm@kvack.org
> cc: linux-cachefs@redhat.com
> cc: linux-afs@lists.infradead.org
> cc: linux-nfs@vger.kernel.org
> cc: linux-cifs@vger.kernel.org
> cc: ceph-devel@vger.kernel.org
> cc: v9fs-developer@lists.sourceforge.net
> cc: linux-fsdevel@vger.kernel.org
> Link: https://lore.kernel.org/r/CAMuHMdXJZ7iNQE964CdBOU=vRKVMFzo=YF_eiwsGgqzuvZ+TuA@mail.gmail.com
> ---
> 
>  fs/netfs/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/netfs/Kconfig b/fs/netfs/Kconfig
> index 578112713703..b4db21022cb4 100644
> --- a/fs/netfs/Kconfig
> +++ b/fs/netfs/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
>  config NETFS_SUPPORT
> -	tristate "Support for network filesystem high-level I/O"
> +	tristate
>  	help
>  	  This option enables support for network filesystems, including
>  	  helpers for high-level buffered I/O, abstracting out read
> 
> 

Makes sense. No one is going to enable this w/o a fs that uses it, so
might as well make it automagic.

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

