Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D14262BFF1
	for <lists+linux-cachefs@lfdr.de>; Wed, 16 Nov 2022 14:47:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668606470;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+VmFC4BP77i3BrF1YT06+cVUF3ArjI2qNQgg8a8Gbh4=;
	b=JaocHimrqxl/GT/G2qKrHCw5hDNgl4W9IIzYcfOSM5rkrzVEPVAMEL/GJv4XpRdDT1mTuV
	kjcSoQbWJTYhHa9h3qABfIdTeic0YujyHNlnlkGVxp+LFt2ttJS21KiAWO5lHNMW2lCRkQ
	tZhKLSe2VK3Fe+Clhdp+1k4QFvlnb0I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-Mis3fLpqOsivbMsDuukhrw-1; Wed, 16 Nov 2022 08:47:47 -0500
X-MC-Unique: Mis3fLpqOsivbMsDuukhrw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C4421C09B71;
	Wed, 16 Nov 2022 13:47:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 765542166B29;
	Wed, 16 Nov 2022 13:47:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5839519465A8;
	Wed, 16 Nov 2022 13:47:44 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F017E19465A2 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 16 Nov 2022 13:41:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B3F531415114; Wed, 16 Nov 2022 13:41:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 723EE140EBF3;
 Wed, 16 Nov 2022 13:41:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2b595b62f6ecd28298a860fcdc5b4941dcafd9eb.camel@kernel.org>
References: <2b595b62f6ecd28298a860fcdc5b4941dcafd9eb.camel@kernel.org>
 <20221116104502.107431-1-jefflexu@linux.alibaba.com>
 <20221116104502.107431-2-jefflexu@linux.alibaba.com>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Wed, 16 Nov 2022 13:41:41 +0000
Message-ID: <2968419.1668606101@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v3 1/2] fscache,
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
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com, xiang@kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2968418.1668606101.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> > +static enum netfs_io_source cachefiles_do_prepare_read(struct netfs_cache_resources *cres,
> > +					loff_t *_start, size_t *_len,
> > +					unsigned long *_flags, loff_t i_size)
>
> _start is never changed, so it should be passed by value instead of by
> pointer.

Hmmm.  The intention was that the start pointer should be able to be moved
backwards by the cache - but that's not necessary in ->prepare_read() and
->expand_readahead() is provided for that now.  So yes, the start pointer
shouldn't get changed at this point.

> I'd also reverse the position of the arguments for _flags and i_size.
> Otherwise, the CPU/compiler have to shuffle things around more in
> cachefiles_prepare_ondemand_read before they call this.

Better to pass the flags in and then ignore them.  That way it can tail call,
or just call cachefiles_do_prepare_read() directly from erofs.  If you're
going to have a wrapper, then you might be just as well create a
netfs_io_subrequest struct on the stack.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

