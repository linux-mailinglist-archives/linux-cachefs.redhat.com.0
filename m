Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D64B1496486
	for <lists+linux-cachefs@lfdr.de>; Fri, 21 Jan 2022 18:53:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-paXr0i9tP1ifnMiFI2RosQ-1; Fri, 21 Jan 2022 12:53:30 -0500
X-MC-Unique: paXr0i9tP1ifnMiFI2RosQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 528D68144E7;
	Fri, 21 Jan 2022 17:53:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C56684D25;
	Fri, 21 Jan 2022 17:53:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADA0A1809C87;
	Fri, 21 Jan 2022 17:53:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20LHrLDj005418 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 21 Jan 2022 12:53:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6BA192166B2D; Fri, 21 Jan 2022 17:53:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67B092166BB1
	for <linux-cachefs@redhat.com>; Fri, 21 Jan 2022 17:53:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F53985A5AA
	for <linux-cachefs@redhat.com>; Fri, 21 Jan 2022 17:53:18 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-225-IEN4UV87Oo2Epu9HO9immw-1; Fri, 21 Jan 2022 12:53:16 -0500
X-MC-Unique: IEN4UV87Oo2Epu9HO9immw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 44005CE2421;
	Fri, 21 Jan 2022 17:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F25C340E1;
	Fri, 21 Jan 2022 17:53:09 +0000 (UTC)
Message-ID: <952f31150513af64ca5ccbb440d1e0ca88a37900.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Fri, 21 Jan 2022 12:53:08 -0500
In-Reply-To: <164251404666.3435901.17331742792401482190.stgit@warthog.procyon.org.uk>
References: <164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
	<164251404666.3435901.17331742792401482190.stgit@warthog.procyon.org.uk>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, Dominique,
	Torvalds <torvalds@linux-foundation.org>,
	Martinet <asmadeus@codewreck.org>, linux-fsdevel@vger.kernel.org,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <smfrench@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net,
	Omar Sandoval <osandov@osandov.com>, Linus,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 05/11] cachefiles: Trace active-mark
	failure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2022-01-18 at 13:54 +0000, David Howells wrote:
> Add a tracepoint to log failure to apply an active mark to a file in
> addition to tracing successfully setting and unsetting the mark.
> 
> Also include the backing file inode number in the message logged to dmesg.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com
> ---
> 
>  fs/cachefiles/namei.c             |    4 +++-
>  include/trace/events/cachefiles.h |   21 +++++++++++++++++++++
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
> index 52c9f0864a87..f256c8aff7bb 100644
> --- a/fs/cachefiles/namei.c
> +++ b/fs/cachefiles/namei.c
> @@ -25,7 +25,9 @@ static bool __cachefiles_mark_inode_in_use(struct cachefiles_object *object,
>  		trace_cachefiles_mark_active(object, inode);
>  		can_use = true;
>  	} else {
> -		pr_notice("cachefiles: Inode already in use: %pd\n", dentry);
> +		trace_cachefiles_mark_failed(object, inode);
> +		pr_notice("cachefiles: Inode already in use: %pd (B=%lx)\n",
> +			  dentry, inode->i_ino);
>  	}
>  
>  	return can_use;
> diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
> index 093c4acb7a3a..c6f5aa74db89 100644
> --- a/include/trace/events/cachefiles.h
> +++ b/include/trace/events/cachefiles.h
> @@ -573,6 +573,27 @@ TRACE_EVENT(cachefiles_mark_active,
>  		      __entry->obj, __entry->inode)
>  	    );
>  
> +TRACE_EVENT(cachefiles_mark_failed,
> +	    TP_PROTO(struct cachefiles_object *obj,
> +		     struct inode *inode),
> +
> +	    TP_ARGS(obj, inode),
> +
> +	    /* Note that obj may be NULL */
> +	    TP_STRUCT__entry(
> +		    __field(unsigned int,		obj		)
> +		    __field(ino_t,			inode		)
> +			     ),
> +
> +	    TP_fast_assign(
> +		    __entry->obj	= obj ? obj->debug_id : 0;
> +		    __entry->inode	= inode->i_ino;
> +			   ),
> +
> +	    TP_printk("o=%08x B=%lx",
> +		      __entry->obj, __entry->inode)
> +	    );
> +
>  TRACE_EVENT(cachefiles_mark_inactive,
>  	    TP_PROTO(struct cachefiles_object *obj,
>  		     struct inode *inode),
> 
> 

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

