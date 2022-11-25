Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1223D63894A
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Nov 2022 12:58:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669377489;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=54vTFKPr/i3xc5yxTqAP1US3I7HG8YufC0Gy84Cahow=;
	b=VcjnN3jhhWPV0gR4bAjn5yyxaJGQF69g64Y2ChtLf88YyM7tVm1S1nLD1VBrk3NT7ruUQM
	c43Pc9nwvomT5xKFTRdJzd+SEDmimMQ/T6pd6uzbn0bxNLG9FMgNanIqSpOoFMdXq+IY2A
	iz5Ygf5gMG0T4Yt97s4SXbYQLldt46E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-RYRDgaYDO2i7O5xmfA17Ng-1; Fri, 25 Nov 2022 06:58:06 -0500
X-MC-Unique: RYRDgaYDO2i7O5xmfA17Ng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA44D3826A43;
	Fri, 25 Nov 2022 11:58:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60EF0C15BA5;
	Fri, 25 Nov 2022 11:58:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 21DFC194658C;
	Fri, 25 Nov 2022 11:58:03 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 922AA1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Nov 2022 11:58:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4D27C1415137; Fri, 25 Nov 2022 11:58:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F07601415121;
 Fri, 25 Nov 2022 11:58:00 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20221124034212.81892-2-jefflexu@linux.alibaba.com>
References: <20221124034212.81892-2-jefflexu@linux.alibaba.com>
 <20221124034212.81892-1-jefflexu@linux.alibaba.com>
To: Jingbo Xu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Fri, 25 Nov 2022 11:57:58 +0000
Message-ID: <2386961.1669377478@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v5 1/2] fscache,
 cachefiles: add prepare_ondemand_read() callback
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
Cc: chao@kernel.org, jlayton@kernel.org, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org, xiang@kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2386960.1669377478.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jingbo Xu <jefflexu@linux.alibaba.com> wrote:

> Add prepare_ondemand_read() callback dedicated for the on-demand read
> scenario, so that callers from this scenario can be decoupled from
> netfs_io_subrequest.
> 
> The original cachefiles_prepare_read() is now refactored to a generic
> routine accepting a parameter list instead of netfs_io_subrequest.
> There's no logic change, except that the debug id of subrequest and
> request is removed from trace_cachefiles_prep_read().
> 
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>

Acked-by: David Howells <dhowells@redhat.com>
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

