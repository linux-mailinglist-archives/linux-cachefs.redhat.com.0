Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 896954D3A95
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 20:47:09 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-jHU_xUd3M6209ESP1Hla0Q-1; Wed, 09 Mar 2022 14:47:05 -0500
X-MC-Unique: jHU_xUd3M6209ESP1Hla0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 115F83C00087;
	Wed,  9 Mar 2022 19:47:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC08740D2970;
	Wed,  9 Mar 2022 19:47:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 82B131953566;
	Wed,  9 Mar 2022 19:47:04 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1935A1953550 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  9 Mar 2022 19:47:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0732A1410F3B; Wed,  9 Mar 2022 19:47:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 038E0140EBD5
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 19:47:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE5DE85A5BE
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 19:47:02 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-WFU0USh2MXyLB8SbMIj3ug-1; Wed, 09 Mar 2022 14:46:59 -0500
X-MC-Unique: WFU0USh2MXyLB8SbMIj3ug-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA2C4B82365;
 Wed,  9 Mar 2022 19:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47679C340EC;
 Wed,  9 Mar 2022 19:46:54 +0000 (UTC)
Message-ID: <beaf4f6a6c2575ed489adb14b257253c868f9a5c.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>
Date: Wed, 09 Mar 2022 14:46:52 -0500
In-Reply-To: <1790300.1646853782@warthog.procyon.org.uk>
References: <8af0d47f17d89c06bbf602496dd845f2b0bf25b3.camel@kernel.org>
 <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
 <164678213320.1200972.16807551936267647470.stgit@warthog.procyon.org.uk>
 <1790300.1646853782@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-afs@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
 linux-cachefs@redhat.com, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dominique Martinet <asmadeus@codewreck.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-03-09 at 19:23 +0000, David Howells wrote:
> Jeff Layton <jlayton@kernel.org> wrote:
> 
> > > Add a netfs_i_context struct that should be included in the network
> > > filesystem's own inode struct wrapper, directly after the VFS's inode
> > > struct, e.g.:
> > > 
> > > 	struct my_inode {
> > > 		struct {
> > > 			struct inode		vfs_inode;
> > > 			struct netfs_i_context	netfs_ctx;
> > > 		};
> > 
> > This seems a bit klunky.
> > 
> > I think it'd be better encapsulation to give this struct a name (e.g.
> > netfs_inode) and then have the filesystems replace the embedded
> > vfs_inode with a netfs_inode.
> 
> I think what you really want is:
> 
> 	struct my_inode : netfs_inode {
> 	};
> 
> right? ;-)
> 

Sort of, I guess.  The natural way to enforce the requirement that the
inode and context be ordered and adjacent like that is to make a struct
that embeds them both.

My thinking was that someone at some point will try to move things
around if they're just adjacent like this rather than an encapsulated
"object".

If we go this route, then please leave some comments in each filesystem
warning people off from breaking them up.

> > That way it's still just pointer math to get to the context from the
> > inode and vice versa, but the replacement seems a bit cleaner.
> > 
> > It might mean a bit more churn in the filesystems themselves as you
> > convert them, but most of them use macros or inline functions as
> > accessors so it shouldn't be _too_ bad.
> 
> That's a lot of churn - and will definitely cause conflicts with other
> patches aimed at those filesystems.  I'd prefer to avoid that if I can.
> 

Good point. Looks like around 200 or so places that would need to change
in the affected filesystems.

> > > +static int ceph_init_request(struct netfs_io_request *rreq, struct file *file)
> > > +{
> > > ...
> > > +}
> > > +
> > 
> > ^^^
> > The above change seems like it should be in its own patch. Wasn't it at
> > one point? Converting this to use init_request doesn't seem to rely on
> > the new embedded context.
> 
> Well, I wrote it as a separate patch on the end for convenience, but I
> intended to merge it here otherwise ceph wouldn't be able to do readahead for
> a few patches.
> 
> I was thinking that it would require the context change to work and certainly
> it requires the error-return-from-init_request patch to work, but actually it
> probably doesn't require the former so I could probably separate that bit out
> and put it between 11 and 12.
> 

Ok.

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

