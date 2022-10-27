Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0285B60F8C0
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Oct 2022 15:13:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666876423;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h/BvjVUI40u1cwGM+Bf6L/2S7YK1KktAKv4ku3u5KOU=;
	b=ayqiR7t7J6Y/eToUDJ0gJIRe8eYJnoY9jxwkwit4tQDvb2OtLt2Fg+0pdN7O52eKKrwA1P
	L4iDacxXqP+fvpGGQA+ZqfsaqFM76DSxx9CuBTnSiiGJD+Fzq0FAo9ONGdLFLJKxFnXtxB
	UMwwTaylAWBV7PYGppI7erGtAZpsi4M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-llgik0SDN-2TLxH5VxL9Kw-1; Thu, 27 Oct 2022 09:13:40 -0400
X-MC-Unique: llgik0SDN-2TLxH5VxL9Kw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF5ED1C09B85;
	Thu, 27 Oct 2022 13:13:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C11B12166B26;
	Thu, 27 Oct 2022 13:13:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B4AA919466DF;
	Thu, 27 Oct 2022 13:13:14 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3DC971946597 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 13:13:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1667B1415139; Thu, 27 Oct 2022 13:13:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97E181415117;
 Thu, 27 Oct 2022 13:13:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20221027083547.46933-10-jefflexu@linux.alibaba.com>
References: <20221027083547.46933-10-jefflexu@linux.alibaba.com>
 <20221027083547.46933-1-jefflexu@linux.alibaba.com>
To: Jingbo Xu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Thu, 27 Oct 2022 14:13:03 +0100
Message-ID: <3306696.1666876383@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH 9/9] fscache,
 netfs: move "fscache_" prefixed structures to fscache.h
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3306695.1666876383.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jingbo Xu <jefflexu@linux.alibaba.com> wrote:

> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index 2ad4e1e88106..1977f953633a 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -16,19 +16,10 @@
>  
>  #include <linux/workqueue.h>
>  #include <linux/fs.h>
> +#include <linux/fscache.h>

Please don't do that.  fscache is based on netfslib, not the other way around.

If anything, I'm tempted to move fscache into netfslib.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

