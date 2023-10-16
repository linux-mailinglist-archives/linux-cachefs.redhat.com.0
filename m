Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C6A7CAC5F
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Oct 2023 16:53:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697468028;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2VF3tEYT+bB8BB8jvOE3riEIsulGoXHhM6UIpNFhM5Q=;
	b=fDP/4XRSp7cYE7L4UOF2nwZgxfuo5g2zEefWUstOIJOi5RROHMhVI77ZKNHAmS3LnsbMaf
	S8qLJGSRxSzpTEo5FDXCeJ5cb3gIcCBpHrJ6zZI3EwFR6AhnHYA4cXRugNJ9TmZiFej7CO
	LfLTEdiezlsVOWUxgiCOQ1XBKBWPfV0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-SBEXEtsrMGasA-dDBq7RTw-1; Mon, 16 Oct 2023 10:53:45 -0400
X-MC-Unique: SBEXEtsrMGasA-dDBq7RTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEDB585A5BE;
	Mon, 16 Oct 2023 14:53:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 508B340C6F7F;
	Mon, 16 Oct 2023 14:53:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CB091194658C;
	Mon, 16 Oct 2023 14:53:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EB5281946587 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 16 Oct 2023 14:53:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CA73B25C9; Mon, 16 Oct 2023 14:53:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C361125C8
 for <linux-cachefs@redhat.com>; Mon, 16 Oct 2023 14:53:41 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EDDC299E745
 for <linux-cachefs@redhat.com>; Mon, 16 Oct 2023 14:53:41 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-376-3YO8vuOgP1adcYeNDS9oEA-1; Mon,
 16 Oct 2023 10:53:34 -0400
X-MC-Unique: 3YO8vuOgP1adcYeNDS9oEA-1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E204CB81617;
 Mon, 16 Oct 2023 14:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C62C433C7;
 Mon, 16 Oct 2023 14:44:25 +0000 (UTC)
Message-ID: <bd10b3e5a826d8658a2ee6bba510d25b27c35b50.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, Steve French <smfrench@gmail.com>
Date: Mon, 16 Oct 2023 10:44:24 -0400
In-Reply-To: <20231013155727.2217781-2-dhowells@redhat.com>
References: <20231013155727.2217781-1-dhowells@redhat.com>
 <20231013155727.2217781-2-dhowells@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Subject: Re: [Linux-cachefs] [RFC PATCH 01/53] netfs: Add a procfile to list
 in-progress requests
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
Cc: Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Shyam Prasad N <sprasad@microsoft.com>, linux-kernel@vger.kernel.org,
 v9fs@lists.linux.dev, netdev@vger.kernel.org,
 Dominique Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Tom Talpey <tom@talpey.com>,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com, linux-mm@kvack.org,
 Marc Dionne <marc.dionne@auristor.com>, Ilya Dryomov <idryomov@gmail.com>,
 linux-afs@lists.infradead.org, Christian Brauner <christian@brauner.io>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2023-10-13 at 16:56 +0100, David Howells wrote:
> Add a procfile, /proc/fs/netfs/requests, to list in-progress netfslib I/O
> requests.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: linux-cachefs@redhat.com
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-mm@kvack.org
> ---
>  fs/netfs/internal.h   | 22 +++++++++++
>  fs/netfs/main.c       | 91 +++++++++++++++++++++++++++++++++++++++++++
>  fs/netfs/objects.c    |  4 +-
>  include/linux/netfs.h |  6 ++-
>  4 files changed, 121 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
> index 43fac1b14e40..1f067aa96c50 100644
> --- a/fs/netfs/internal.h
> +++ b/fs/netfs/internal.h
> @@ -29,6 +29,28 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync);
>   * main.c
>   */
>  extern unsigned int netfs_debug;
> +extern struct list_head netfs_io_requests;
> +extern spinlock_t netfs_proc_lock;
> +
> +#ifdef CONFIG_PROC_FS
> +static inline void netfs_proc_add_rreq(struct netfs_io_request *rreq)
> +{
> +	spin_lock(&netfs_proc_lock);
> +	list_add_tail_rcu(&rreq->proc_link, &netfs_io_requests);
> +	spin_unlock(&netfs_proc_lock);
> +}
> +static inline void netfs_proc_del_rreq(struct netfs_io_request *rreq)
> +{
> +	if (!list_empty(&rreq->proc_link)) {
> +		spin_lock(&netfs_proc_lock);
> +		list_del_rcu(&rreq->proc_link);
> +		spin_unlock(&netfs_proc_lock);
> +	}
> +}
> +#else
> +static inline void netfs_proc_add_rreq(struct netfs_io_request *rreq) {}
> +static inline void netfs_proc_del_rreq(struct netfs_io_request *rreq) {}
> +#endif
>  
>  /*
>   * objects.c
> diff --git a/fs/netfs/main.c b/fs/netfs/main.c
> index 068568702957..21f814eee6af 100644
> --- a/fs/netfs/main.c
> +++ b/fs/netfs/main.c
> @@ -7,6 +7,8 @@
>  
>  #include <linux/module.h>
>  #include <linux/export.h>
> +#include <linux/proc_fs.h>
> +#include <linux/seq_file.h>
>  #include "internal.h"
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/netfs.h>
> @@ -18,3 +20,92 @@ MODULE_LICENSE("GPL");
>  unsigned netfs_debug;
>  module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
>  MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
> +
> +#ifdef CONFIG_PROC_FS
> +LIST_HEAD(netfs_io_requests);
> +DEFINE_SPINLOCK(netfs_proc_lock);
> +
> +static const char *netfs_origins[] = {
> +	[NETFS_READAHEAD]	= "RA",
> +	[NETFS_READPAGE]	= "RP",
> +	[NETFS_READ_FOR_WRITE]	= "RW",
> +};
> +
> +/*
> + * Generate a list of I/O requests in /proc/fs/netfs/requests
> + */
> +static int netfs_requests_seq_show(struct seq_file *m, void *v)
> +{
> +	struct netfs_io_request *rreq;
> +
> +	if (v == &netfs_io_requests) {
> +		seq_puts(m,
> +			 "REQUEST  OR REF FL ERR  OPS COVERAGE\n"
> +			 "======== == === == ==== === =========\n"
> +			 );
> +		return 0;
> +	}
> +
> +	rreq = list_entry(v, struct netfs_io_request, proc_link);
> +	seq_printf(m,
> +		   "%08x %s %3d %2lx %4d %3d @%04llx %zx/%zx",
> +		   rreq->debug_id,
> +		   netfs_origins[rreq->origin],
> +		   refcount_read(&rreq->ref),
> +		   rreq->flags,
> +		   rreq->error,
> +		   atomic_read(&rreq->nr_outstanding),
> +		   rreq->start, rreq->submitted, rreq->len);
> +	seq_putc(m, '\n');
> +	return 0;
> +}
> +
> +static void *netfs_requests_seq_start(struct seq_file *m, loff_t *_pos)
> +	__acquires(rcu)
> +{
> +	rcu_read_lock();
> +	return seq_list_start_head(&netfs_io_requests, *_pos);
> +}
> +
> +static void *netfs_requests_seq_next(struct seq_file *m, void *v, loff_t *_pos)
> +{
> +	return seq_list_next(v, &netfs_io_requests, _pos);
> +}
> +
> +static void netfs_requests_seq_stop(struct seq_file *m, void *v)
> +	__releases(rcu)
> +{
> +	rcu_read_unlock();
> +}
> +
> +static const struct seq_operations netfs_requests_seq_ops = {
> +	.start  = netfs_requests_seq_start,
> +	.next   = netfs_requests_seq_next,
> +	.stop   = netfs_requests_seq_stop,
> +	.show   = netfs_requests_seq_show,
> +};
> +#endif /* CONFIG_PROC_FS */
> +
> +static int __init netfs_init(void)
> +{
> +	if (!proc_mkdir("fs/netfs", NULL))
> +		goto error;
> +

It seems like this should go under debugfs instead.

> +	if (!proc_create_seq("fs/netfs/requests", S_IFREG | 0444, NULL,
> +			     &netfs_requests_seq_ops))
> +		goto error_proc;
> +
> +	return 0;
> +
> +error_proc:
> +	remove_proc_entry("fs/netfs", NULL);
> +error:
> +	return -ENOMEM;
> +}
> +fs_initcall(netfs_init);
> +
> +static void __exit netfs_exit(void)
> +{
> +	remove_proc_entry("fs/netfs", NULL);
> +}
> +module_exit(netfs_exit);
> diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
> index e17cdf53f6a7..85f428fc52e6 100644
> --- a/fs/netfs/objects.c
> +++ b/fs/netfs/objects.c
> @@ -45,6 +45,7 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
>  		}
>  	}
>  
> +	netfs_proc_add_rreq(rreq);
>  	netfs_stat(&netfs_n_rh_rreq);
>  	return rreq;
>  }
> @@ -76,12 +77,13 @@ static void netfs_free_request(struct work_struct *work)
>  		container_of(work, struct netfs_io_request, work);
>  
>  	trace_netfs_rreq(rreq, netfs_rreq_trace_free);
> +	netfs_proc_del_rreq(rreq);
>  	netfs_clear_subrequests(rreq, false);
>  	if (rreq->netfs_ops->free_request)
>  		rreq->netfs_ops->free_request(rreq);
>  	if (rreq->cache_resources.ops)
>  		rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
> -	kfree(rreq);
> +	kfree_rcu(rreq, rcu);
>  	netfs_stat_d(&netfs_n_rh_rreq);
>  }
>  
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index b11a84f6c32b..b447cb67f599 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -175,10 +175,14 @@ enum netfs_io_origin {
>   * operations to a variety of data stores and then stitch the result together.
>   */
>  struct netfs_io_request {
> -	struct work_struct	work;
> +	union {
> +		struct work_struct work;
> +		struct rcu_head rcu;
> +	};
>  	struct inode		*inode;		/* The file being accessed */
>  	struct address_space	*mapping;	/* The mapping being accessed */
>  	struct netfs_cache_resources cache_resources;
> +	struct list_head	proc_link;	/* Link in netfs_iorequests */
>  	struct list_head	subrequests;	/* Contributory I/O operations */
>  	void			*netfs_priv;	/* Private data for the netfs */
>  	unsigned int		debug_id;
> 

ACK on the general concept however. This is useful debugging info.
-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

