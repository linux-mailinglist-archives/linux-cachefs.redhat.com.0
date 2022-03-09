Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E63A4D32B5
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 17:12:01 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-T1jU5OGrMSKcmCDWu9iW0g-1; Wed, 09 Mar 2022 11:11:59 -0500
X-MC-Unique: T1jU5OGrMSKcmCDWu9iW0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88E6118019E6;
	Wed,  9 Mar 2022 16:11:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AE46C5094A;
	Wed,  9 Mar 2022 16:11:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5EC251953554;
	Wed,  9 Mar 2022 16:11:55 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9CD461953540 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  9 Mar 2022 15:46:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5CA89697C97; Wed,  9 Mar 2022 15:46:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58747674C60
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 15:46:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4060D101AA47
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 15:46:00 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-PX9Q-oghP-qlK7qABzTfIA-1; Wed, 09 Mar 2022 10:45:56 -0500
X-MC-Unique: PX9Q-oghP-qlK7qABzTfIA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 10E03B8216D;
 Wed,  9 Mar 2022 15:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42702C340E8;
 Wed,  9 Mar 2022 15:45:52 +0000 (UTC)
Message-ID: <9763458f708e3021f7606cfdb4c578f2591b9bd7.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Wed, 09 Mar 2022 10:45:51 -0500
In-Reply-To: <164678199468.1200972.17275585970238114726.stgit@warthog.procyon.org.uk>
References: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
 <164678199468.1200972.17275585970238114726.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH v2 06/19] netfs: Adjust the netfs_rreq
 tracepoint slightly
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2022-03-08 at 23:26 +0000, David Howells wrote:
> Adjust the netfs_rreq tracepoint to include the origin of the request and
> to increase the size of the "what trace" output strings by a character so
> that "ENCRYPT" and "DECRYPT" will fit without abbreviation.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com
> 
> Link: https://lore.kernel.org/r/164622996715.3564931.4252319907990358129.stgit@warthog.procyon.org.uk/ # v1
> ---
> 
>  fs/netfs/read_helper.c       |    2 +-
>  include/trace/events/netfs.h |   18 +++++++++---------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
> index ef23ef9889d5..181aeda32649 100644
> --- a/fs/netfs/read_helper.c
> +++ b/fs/netfs/read_helper.c
> @@ -181,7 +181,7 @@ static void netfs_rreq_do_write_to_cache(struct netfs_io_request *rreq)
>  	struct iov_iter iter;
>  	int ret;
>  
> -	trace_netfs_rreq(rreq, netfs_rreq_trace_write);
> +	trace_netfs_rreq(rreq, netfs_rreq_trace_copy);
>  
>  	/* We don't want terminating writes trying to wake us up whilst we're
>  	 * still going through the list.
> diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
> index 2d0665b416bf..daf171de2142 100644
> --- a/include/trace/events/netfs.h
> +++ b/include/trace/events/netfs.h
> @@ -22,13 +22,13 @@
>  	E_(netfs_read_trace_write_begin,	"WRITEBEGN")
>  
>  #define netfs_rreq_traces					\
> -	EM(netfs_rreq_trace_assess,		"ASSESS")	\
> -	EM(netfs_rreq_trace_done,		"DONE  ")	\
> -	EM(netfs_rreq_trace_free,		"FREE  ")	\
> -	EM(netfs_rreq_trace_resubmit,		"RESUBM")	\
> -	EM(netfs_rreq_trace_unlock,		"UNLOCK")	\
> -	EM(netfs_rreq_trace_unmark,		"UNMARK")	\
> -	E_(netfs_rreq_trace_write,		"WRITE ")
> +	EM(netfs_rreq_trace_assess,		"ASSESS ")	\
> +	EM(netfs_rreq_trace_copy,		"COPY   ")	\
> +	EM(netfs_rreq_trace_done,		"DONE   ")	\
> +	EM(netfs_rreq_trace_free,		"FREE   ")	\
> +	EM(netfs_rreq_trace_resubmit,		"RESUBMT")	\
> +	EM(netfs_rreq_trace_unlock,		"UNLOCK ")	\
> +	E_(netfs_rreq_trace_unmark,		"UNMARK ")
>  
>  #define netfs_sreq_sources					\
>  	EM(NETFS_FILL_WITH_ZEROES,		"ZERO")		\
> @@ -134,7 +134,7 @@ TRACE_EVENT(netfs_rreq,
>  
>  	    TP_STRUCT__entry(
>  		    __field(unsigned int,		rreq		)
> -		    __field(unsigned short,		flags		)
> +		    __field(unsigned int,		flags		)
>  		    __field(enum netfs_rreq_trace,	what		)
>  			     ),
>  
> @@ -182,8 +182,8 @@ TRACE_EVENT(netfs_sreq,
>  
>  	    TP_printk("R=%08x[%u] %s %s f=%02x s=%llx %zx/%zx e=%d",
>  		      __entry->rreq, __entry->index,
> -		      __print_symbolic(__entry->what, netfs_sreq_traces),
>  		      __print_symbolic(__entry->source, netfs_sreq_sources),
> +		      __print_symbolic(__entry->what, netfs_sreq_traces),
>  		      __entry->flags,
>  		      __entry->start, __entry->transferred, __entry->len,
>  		      __entry->error)
> 
> 

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

