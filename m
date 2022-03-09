Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8954C4D3A2E
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 20:23:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646853807;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s7PH3jeQXl9/fV+qHoZcaVBbHsJCyrU+//I+p7FY7zA=;
	b=TR9fpPYYJ84tsBj6WHy92vfhgy/taCM0S1OPRY35tfVtL7VsVO1q792FH4ei5tbaBUAOMq
	eZWYqkyYn+X+cKboVI4F/1Cl3N571DZPHVdlPwebcFhAQhdVAxwR7uyeQxCgYWG2K+Cxn/
	h6RptZRr/UexExEhPKq7nKD1R7jDstY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-EeFRDdd_Oi-rScTgjJSpqw-1; Wed, 09 Mar 2022 14:23:26 -0500
X-MC-Unique: EeFRDdd_Oi-rScTgjJSpqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E4448047D6;
	Wed,  9 Mar 2022 19:23:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95051C080AA;
	Wed,  9 Mar 2022 19:23:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 76BF4195355E;
	Wed,  9 Mar 2022 19:23:23 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 94A5E195354E for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  9 Mar 2022 19:23:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1CAEF39A5E; Wed,  9 Mar 2022 19:23:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAFF345D76;
 Wed,  9 Mar 2022 19:23:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <8af0d47f17d89c06bbf602496dd845f2b0bf25b3.camel@kernel.org>
References: <8af0d47f17d89c06bbf602496dd845f2b0bf25b3.camel@kernel.org>
 <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
 <164678213320.1200972.16807551936267647470.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Wed, 09 Mar 2022 19:23:02 +0000
Message-ID: <1790300.1646853782@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Subject: Re: [Linux-cachefs] [PATCH v2 12/19] netfs: Add a netfs inode
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1790299.1646853782.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> > Add a netfs_i_context struct that should be included in the network
> > filesystem's own inode struct wrapper, directly after the VFS's inode
> > struct, e.g.:
> > 
> > 	struct my_inode {
> > 		struct {
> > 			struct inode		vfs_inode;
> > 			struct netfs_i_context	netfs_ctx;
> > 		};
> 
> This seems a bit klunky.
>
> I think it'd be better encapsulation to give this struct a name (e.g.
> netfs_inode) and then have the filesystems replace the embedded
> vfs_inode with a netfs_inode.

I think what you really want is:

	struct my_inode : netfs_inode {
	};

right? ;-)

> That way it's still just pointer math to get to the context from the
> inode and vice versa, but the replacement seems a bit cleaner.
> 
> It might mean a bit more churn in the filesystems themselves as you
> convert them, but most of them use macros or inline functions as
> accessors so it shouldn't be _too_ bad.

That's a lot of churn - and will definitely cause conflicts with other
patches aimed at those filesystems.  I'd prefer to avoid that if I can.

> > +static int ceph_init_request(struct netfs_io_request *rreq, struct file *file)
> > +{
> > ...
> > +}
> > +
> 
> ^^^
> The above change seems like it should be in its own patch. Wasn't it at
> one point? Converting this to use init_request doesn't seem to rely on
> the new embedded context.

Well, I wrote it as a separate patch on the end for convenience, but I
intended to merge it here otherwise ceph wouldn't be able to do readahead for
a few patches.

I was thinking that it would require the context change to work and certainly
it requires the error-return-from-init_request patch to work, but actually it
probably doesn't require the former so I could probably separate that bit out
and put it between 11 and 12.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

