Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8521A3A8659
	for <lists+linux-cachefs@lfdr.de>; Tue, 15 Jun 2021 18:24:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-Q5mrPXXbNFu-KSC49rQ71Q-1; Tue, 15 Jun 2021 12:24:09 -0400
X-MC-Unique: Q5mrPXXbNFu-KSC49rQ71Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10607803625;
	Tue, 15 Jun 2021 16:24:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB3FD19C66;
	Tue, 15 Jun 2021 16:24:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEE3C1809CAD;
	Tue, 15 Jun 2021 16:24:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15FGNopX023189 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 15 Jun 2021 12:23:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1F671041AFD; Tue, 15 Jun 2021 16:23:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDD851041AFC
	for <linux-cachefs@redhat.com>; Tue, 15 Jun 2021 16:23:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CB14101D220
	for <linux-cachefs@redhat.com>; Tue, 15 Jun 2021 16:23:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-202-eV8lDyEzNuKULE4XAm-nug-1;
	Tue, 15 Jun 2021 12:23:44 -0400
X-MC-Unique: eV8lDyEzNuKULE4XAm-nug-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2F72616E9;
	Tue, 15 Jun 2021 16:23:42 +0000 (UTC)
Message-ID: <46e23dac5a459ece61250d36d3ac1cedb17f9433.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>
Date: Tue, 15 Jun 2021 12:23:41 -0400
In-Reply-To: <162377165897.729347.292567369593752239.stgit@warthog.procyon.org.uk>
References: <162377165897.729347.292567369593752239.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.2 (3.40.2-1.fc34)
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: Add MAINTAINERS record
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

On Tue, 2021-06-15 at 16:40 +0100, David Howells wrote:
> Add a MAINTAINERS record for the new netfs helper library.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> cc: linux-mm@kvack.org
> cc: linux-cachefs@redhat.com
> cc: linux-afs@lists.infradead.org
> cc: linux-nfs@vger.kernel.org
> cc: linux-cifs@vger.kernel.org
> cc: ceph-devel@vger.kernel.org
> cc: v9fs-developer@lists.sourceforge.net
> cc: linux-fsdevel@vger.kernel.org
> ---
> 
>  MAINTAINERS |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bc0ceef87b73..364465f20e81 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12878,6 +12878,15 @@ NETWORKING [WIRELESS]
>  L:	linux-wireless@vger.kernel.org
>  Q:	http://patchwork.kernel.org/project/linux-wireless/list/
>  
> +NETWORK FILESYSTEM HELPER LIBRARY
> +M:	David Howells <dhowells@redhat.com>
> +M:	Jeff Layton <jlayton@kernel.org>
> +L:	linux-cachefs@redhat.com (moderated for non-subscribers)
> +S:	Supported
> +F:	Documentation/filesystems/netfs_library.rst
> +F:	fs/netfs/
> +F:	include/linux/netfs.h
> +
>  NETXEN (1/10) GbE SUPPORT
>  M:	Manish Chopra <manishc@marvell.com>
>  M:	Rahul Verma <rahulv@marvell.com>
> 
> 

Acked-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

