Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EAC4DDBFA
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Mar 2022 15:48:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647614899;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YBNEl9cpM3219VtqD+Vynf5OxWSJsWEYGEudTh3Rl+A=;
	b=WV0zS+jBHicnIVDnMs9bQRizmOchKXBqxbdXfBPcMA3GxRe8aPrGtl8zVZL2GS6VsdVF9S
	r4g9BFEWK7mAzWqctPSgmOkB0ZqnR9SgGHU0SQbHE6Cbtx5wptnS7ko/WA4DjSLW2S8O7L
	FGZC7xmKDSeRGQJyBsgBicVrWcxMq60=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-IhIH47D8O5aQ3qylnQnOZA-1; Fri, 18 Mar 2022 10:48:16 -0400
X-MC-Unique: IhIH47D8O5aQ3qylnQnOZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4646A3C01C19;
	Fri, 18 Mar 2022 14:48:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6AE41400E6F;
	Fri, 18 Mar 2022 14:48:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 95E911940373;
	Fri, 18 Mar 2022 14:48:14 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 96608194035B for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 18 Mar 2022 14:48:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8009940D284F; Fri, 18 Mar 2022 14:48:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16A4040D282F;
 Fri, 18 Mar 2022 14:48:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <f5633dea0bfabd40ba548fc8502e5838c033fbae.camel@kernel.org>
References: <f5633dea0bfabd40ba548fc8502e5838c033fbae.camel@kernel.org>
 <164692909854.2099075.9535537286264248057.stgit@warthog.procyon.org.uk>
 <164692883658.2099075.5745824552116419504.stgit@warthog.procyon.org.uk>
 <306388.1647595110@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Fri, 18 Mar 2022 14:48:09 +0000
Message-ID: <666408.1647614889@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH v4 13/20] netfs: Add a netfs inode
 context
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
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 Dominique Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <666407.1647614889.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> > +static inline bool netfs_is_cache_enabled(struct netfs_i_context *ctx)
> > +{
> > +#if IS_ENABLED(CONFIG_FSCACHE)
> > +	struct fscache_cookie *cookie = ctx->cache;
> > +
> > +	return fscache_cookie_valid(cookie) && cookie->cache_priv &&
> > +		fscache_cookie_enabled(cookie);
> 
> 
> As you mentioned in the other thread, it may be cleaner to move the
> cookie->cache_priv check into fscache_cookie_enabled. Is there ever a
> case where you'd need to separate the two checks?

I'm not sure, but I'd prefer not to do it in this series as it would affect
NFS plus some other operations, so will need retesting thoroughly.  I'd prefer
to defer it.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

