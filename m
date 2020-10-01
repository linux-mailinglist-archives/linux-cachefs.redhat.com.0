Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 55A9E280810
	for <lists+linux-cachefs@lfdr.de>; Thu,  1 Oct 2020 21:51:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-f3ceMylrMVizCW4LgTmaLQ-1; Thu, 01 Oct 2020 15:51:55 -0400
X-MC-Unique: f3ceMylrMVizCW4LgTmaLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B6401868431;
	Thu,  1 Oct 2020 19:51:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BF975D9D3;
	Thu,  1 Oct 2020 19:51:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E88B44A4C;
	Thu,  1 Oct 2020 19:51:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 091JplMG015851 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 1 Oct 2020 15:51:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0E6752156A49; Thu,  1 Oct 2020 19:51:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 097002156A4B
	for <linux-cachefs@redhat.com>; Thu,  1 Oct 2020 19:51:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05D358007D9
	for <linux-cachefs@redhat.com>; Thu,  1 Oct 2020 19:51:45 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-387-JBpexWbePbGkspl1DI3_1g-1;
	Thu, 01 Oct 2020 15:51:42 -0400
X-MC-Unique: JBpexWbePbGkspl1DI3_1g-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 085451BE7; Thu,  1 Oct 2020 15:51:42 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 085451BE7
Date: Thu, 1 Oct 2020 15:51:42 -0400
From: "bfields@fieldses.org" <bfields@fieldses.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20201001195142.GG1496@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1155061727.42788071.1600777874179.JavaMail.zimbra@dneg.com>
	<97eff1ee2886c14bcd7972b17330f18ceacdef78.camel@kernel.org>
	<20201001184118.GE1496@fieldses.org>
	<1424d45ba1d140bfcff4ae834c70b0a79daa6807.camel@hammerspace.com>
	<20201001192602.GF1496@fieldses.org>
	<a6294c25cb5eb98193f609a52aa8f4b5d4e81279.camel@hammerspace.com>
MIME-Version: 1.0
In-Reply-To: <a6294c25cb5eb98193f609a52aa8f4b5d4e81279.camel@hammerspace.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 01, 2020 at 07:29:51PM +0000, Trond Myklebust wrote:
> On Thu, 2020-10-01 at 15:26 -0400, bfields@fieldses.org wrote:
> > On Thu, Oct 01, 2020 at 07:24:42PM +0000, Trond Myklebust wrote:
> > > NFS4_CHANGE_TYPE_IS_MONOTONIC_INCR should normally be good enough
> > > to
> > > allow the above optimisation, yes. I'm less sure about whether or
> > > not
> > > we are correct in returning NFS4_CHANGE_TYPE_IS_MONOTONIC_INCR when
> > > in
> > > fact we are adding the ctime and filesystem-specific change
> > > attribute,
> > > but we could fix that too.
> > 
> > Could you explain your concern?
> > 
> 
> Same as before: that the ctime could cause the value to regress if
> someone messes with the system time on the server. Yes, we do add in
> the change attribute, but the value of ctime.tv_sec dominates by a
> factor 2^30.

Got it.

I'd like to just tell people not to do that....

If we think it's too easy a mistake to make, I can think of other
approaches, though filesystem assistance might be required:

- Ideal would be just never to expose uncommitted change attributes to
  the client.  Absent persistant RAM that could be terribly expensive.

- It would help just to have any number that's guaranteed to increase
  after a boot.  Of course, if would to go forward at least as reliably
  as the system time.  We'd put it in the high bits of the on-disk
  i_version.  (We'd rather not just mix it into the returned change
  attribute as we do with ctime, because that would cause clients to
  discard all their caches unnecessarily after boot.)

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

