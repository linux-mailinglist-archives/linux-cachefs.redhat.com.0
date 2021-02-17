Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 595BD31DCAE
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Feb 2021 16:51:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-wTGIVtG6MsOtlGt4f23YtA-1; Wed, 17 Feb 2021 10:51:15 -0500
X-MC-Unique: wTGIVtG6MsOtlGt4f23YtA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B552107ACE6;
	Wed, 17 Feb 2021 15:51:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 185BA10013D7;
	Wed, 17 Feb 2021 15:51:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C54EF4EE0B;
	Wed, 17 Feb 2021 15:51:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HFki71023658 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 10:46:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1423F115D347; Wed, 17 Feb 2021 15:46:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1037E115D341
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 15:46:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6524800962
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 15:46:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-231-ybmyFUYFODivwH_lY3Tx3Q-1;
	Wed, 17 Feb 2021 10:46:39 -0500
X-MC-Unique: ybmyFUYFODivwH_lY3Tx3Q-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43AD664E15;
	Wed, 17 Feb 2021 15:46:36 +0000 (UTC)
Message-ID: <c15e08fdf282b7775e0c3cc7f9139659836a065f.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 17 Feb 2021 10:46:35 -0500
In-Reply-To: <20210217151548.GL2858050@casper.infradead.org>
References: <20210217125845.10319-1-jlayton@kernel.org>
	<20210217125845.10319-7-jlayton@kernel.org>
	<20210217151548.GL2858050@casper.infradead.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11HFki71023658
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org, idryomov@gmail.com,
	ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v2 6/6] ceph: convert ceph_readpages to
	ceph_readahead
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-02-17 at 15:15 +0000, Matthew Wilcox wrote:
> On Wed, Feb 17, 2021 at 07:58:45AM -0500, Jeff Layton wrote:
> > +static void ceph_readahead_cleanup(struct address_space *mapping, void=
 *priv)
> > =A0{
> > +=09struct inode *inode =3D mapping->host;
> > =A0=09struct ceph_inode_info *ci =3D ceph_inode(inode);
> > +=09int got =3D (int)(uintptr_t)priv;
> > =A0
> >=20
> >=20
> >=20
> > =A0=09if (got)
> > =A0=09=09ceph_put_cap_refs(ci, got);
> > =A0}
> > +const struct netfs_read_request_ops ceph_readahead_netfs_ops =3D {
> > +=09.init_rreq=09=09=3D ceph_init_rreq,
> > +=09.is_cache_enabled=09=3D ceph_is_cache_enabled,
> > +=09.begin_cache_operation=09=3D ceph_begin_cache_operation,
> > +=09.issue_op=09=09=3D ceph_netfs_issue_op,
> > +=09.expand_readahead=09=3D ceph_netfs_expand_readahead,
> > +=09.clamp_length=09=09=3D ceph_netfs_clamp_length,
> > +=09.cleanup=09=09=3D ceph_readahead_cleanup,
> > +};
>=20
> It looks to me like this netfs_read_request_ops is the same as the
> ceph_readpage_netfs_ops except for the addition of ceph_readahead_cleanup=
.
> If so, since readpage passes NULL as 'priv', the two read_request_ops
> can be the same ... right?
>=20

Yeah. I can also do the same for the write_begin one. The only
difference there is check_write_begin op, and it's only called in the
write_begin helper.

> also, you don't need that '(int)' cast -- can be just:
>=20
> =09int got =3D (uintptr_t)priv;

Got it, fixed. I'll do some testing with this and re-post in a few days
if it all looks good.

Thanks!
--=20
Jeff Layton <jlayton@kernel.org>


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

