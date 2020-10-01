Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 725232807B8
	for <lists+linux-cachefs@lfdr.de>; Thu,  1 Oct 2020 21:26:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-1q7oUCFtPdSILPgC7CDe0g-1; Thu, 01 Oct 2020 15:26:35 -0400
X-MC-Unique: 1q7oUCFtPdSILPgC7CDe0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE8671921FBA;
	Thu,  1 Oct 2020 19:26:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D035860DA0;
	Thu,  1 Oct 2020 19:26:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9976C1826D2E;
	Thu,  1 Oct 2020 19:26:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 091JQ8Wt012708 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 1 Oct 2020 15:26:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C7D52156A3C; Thu,  1 Oct 2020 19:26:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 850E12156A3D
	for <linux-cachefs@redhat.com>; Thu,  1 Oct 2020 19:26:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7839C18AE948
	for <linux-cachefs@redhat.com>; Thu,  1 Oct 2020 19:26:06 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-307-rAMQC0iVPyKxHNMtp_V7Mw-1;
	Thu, 01 Oct 2020 15:26:03 -0400
X-MC-Unique: rAMQC0iVPyKxHNMtp_V7Mw-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 94D9F6192; Thu,  1 Oct 2020 15:26:02 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 94D9F6192
Date: Thu, 1 Oct 2020 15:26:02 -0400
From: "bfields@fieldses.org" <bfields@fieldses.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20201001192602.GF1496@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1155061727.42788071.1600777874179.JavaMail.zimbra@dneg.com>
	<97eff1ee2886c14bcd7972b17330f18ceacdef78.camel@kernel.org>
	<20201001184118.GE1496@fieldses.org>
	<1424d45ba1d140bfcff4ae834c70b0a79daa6807.camel@hammerspace.com>
MIME-Version: 1.0
In-Reply-To: <1424d45ba1d140bfcff4ae834c70b0a79daa6807.camel@hammerspace.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"jlayton@kernel.org" <jlayton@kernel.org>,
	"daire@dneg.com" <daire@dneg.com>
Subject: Re: [Linux-cachefs] Adventures in NFS re-exporting
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 01, 2020 at 07:24:42PM +0000, Trond Myklebust wrote:
> On Thu, 2020-10-01 at 14:41 -0400, J. Bruce Fields wrote:
> > On Wed, Sep 30, 2020 at 03:30:22PM -0400, Jeff Layton wrote:
> > > On Tue, 2020-09-22 at 13:31 +0100, Daire Byrne wrote:
> > > > This patch helps to avoid this when applied to the re-export
> > > > server but there may be other places where this happens too. I
> > > > accept that this patch is probably not the right/general way to
> > > > do this, but it helps to highlight the issue when re-exporting
> > > > and it works well for our use case:
> > > > 
> > > > --- linux-5.5.0-1.el7.x86_64/fs/nfs/inode.c     2020-01-27
> > > > 00:23:03.000000000 +0000
> > > > +++ new/fs/nfs/inode.c  2020-02-13 16:32:09.013055074 +0000
> > > > @@ -1869,7 +1869,7 @@
> > > >  
> > > >         /* More cache consistency checks */
> > > >         if (fattr->valid & NFS_ATTR_FATTR_CHANGE) {
> > > > -               if (!inode_eq_iversion_raw(inode, fattr-
> > > > >change_attr)) {
> > > > +               if (inode_peek_iversion_raw(inode) < fattr-
> > > > >change_attr) {
> > > >                         /* Could it be a race with writeback? */
> > > >                         if (!(have_writers || have_delegation)) {
> > > >                                 invalid |= NFS_INO_INVALID_DATA
> > > > 
> > > > With this patch, the re-export server's NFS client attribute
> > > > cache is maintained and used by all the clients that then mount
> > > > it. When many hundreds of clients are all doing similar things at
> > > > the same time, the re-export server's NFS client cache is
> > > > invaluable in accelerating the lookups (getattrs).
> > > > 
> > > > Perhaps a more correct approach would be to detect when it is
> > > > knfsd that is accessing the client mount and change the cache
> > > > consistency checks accordingly? 
> > > 
> > > Yeah, I don't think you can do this for the reasons Trond outlined.
> > 
> > I'm not clear whether Trond thought that knfsd's behavior in the case
> > it
> > returns NFS4_CHANGE_TYPE_IS_MONOTONIC_INCR might be good enough to
> > allow
> > this or some other optimization.
> > 
> 
> NFS4_CHANGE_TYPE_IS_MONOTONIC_INCR should normally be good enough to
> allow the above optimisation, yes. I'm less sure about whether or not
> we are correct in returning NFS4_CHANGE_TYPE_IS_MONOTONIC_INCR when in
> fact we are adding the ctime and filesystem-specific change attribute,
> but we could fix that too.

Could you explain your concern?

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

