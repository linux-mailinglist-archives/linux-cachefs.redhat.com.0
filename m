Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D430452D810
	for <lists+linux-cachefs@lfdr.de>; Thu, 19 May 2022 17:43:30 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-jZt7LUL_NN-dVrShJAZhyw-1; Thu, 19 May 2022 11:43:27 -0400
X-MC-Unique: jZt7LUL_NN-dVrShJAZhyw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C980811E78;
	Thu, 19 May 2022 15:43:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2CFF240CF8ED;
	Thu, 19 May 2022 15:43:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C35F9193F6D5;
	Thu, 19 May 2022 15:43:24 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 76793194705A for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 19 May 2022 15:43:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 682812026D2F; Thu, 19 May 2022 15:43:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 635C82026D6A
 for <linux-cachefs@redhat.com>; Thu, 19 May 2022 15:43:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42F28811E75
 for <linux-cachefs@redhat.com>; Thu, 19 May 2022 15:43:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118--2D0djOoMD6FS6ob7fMbMg-1; Thu, 19 May 2022 11:43:22 -0400
X-MC-Unique: -2D0djOoMD6FS6ob7fMbMg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9784E61922;
 Thu, 19 May 2022 15:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A592FC34100;
 Thu, 19 May 2022 15:37:23 +0000 (UTC)
Message-ID: <dabd25e5bc80be5cd2f7d04d6c119b644e706f47.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>
Date: Thu, 19 May 2022 11:37:22 -0400
In-Reply-To: <165296980976.3595490.4887936702439978407.stgit@warthog.procyon.org.uk>
References: <165296980082.3595490.3561111064004493810.stgit@warthog.procyon.org.uk>
 <165296980976.3595490.4887936702439978407.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Linux-cachefs] [PATCH 2/2] netfs: Export netfs_put_subrequest()
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
Cc: linux-cachefs@redhat.com, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2022-05-19 at 15:16 +0100, David Howells wrote:
> Export netfs_put_subrequest() and a couple of tracepoints.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: linux-cachefs@redhat.com
> ---
> 
>  fs/netfs/main.c    |    3 +++
>  fs/netfs/objects.c |    1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/fs/netfs/main.c b/fs/netfs/main.c
> index 068568702957..3d0283f8d0b9 100644
> --- a/fs/netfs/main.c
> +++ b/fs/netfs/main.c
> @@ -15,6 +15,9 @@ MODULE_DESCRIPTION("Network fs support");
>  MODULE_AUTHOR("Red Hat, Inc.");
>  MODULE_LICENSE("GPL");
>  
> +EXPORT_TRACEPOINT_SYMBOL(netfs_rreq);
> +EXPORT_TRACEPOINT_SYMBOL(netfs_sreq);
> +
>  unsigned netfs_debug;
>  module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
>  MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
> diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
> index d6b8c0cbeb7c..cbc40d052b46 100644
> --- a/fs/netfs/objects.c
> +++ b/fs/netfs/objects.c
> @@ -160,3 +160,4 @@ void netfs_put_subrequest(struct netfs_io_subrequest *subreq, bool was_async,
>  	if (dead)
>  		netfs_free_subrequest(subreq, was_async);
>  }
> +EXPORT_SYMBOL(netfs_put_subrequest);
> 
> 

I don't see any callers of this outside of netfs. What's the rationale
for exporting it?
-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

