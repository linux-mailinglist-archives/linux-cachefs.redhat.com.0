Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 56BB530766C
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Jan 2021 13:52:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-VV8ZxxR7Oa2vvMRpsJBMlQ-1; Thu, 28 Jan 2021 07:52:47 -0500
X-MC-Unique: VV8ZxxR7Oa2vvMRpsJBMlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B45D8030A1;
	Thu, 28 Jan 2021 12:52:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64B8C5D743;
	Thu, 28 Jan 2021 12:52:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24D291809C9F;
	Thu, 28 Jan 2021 12:52:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10SCqcvP012322 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 28 Jan 2021 07:52:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E0224115D364; Thu, 28 Jan 2021 12:52:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA9F8115D367
	for <linux-cachefs@redhat.com>; Thu, 28 Jan 2021 12:52:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C2A6101A53F
	for <linux-cachefs@redhat.com>; Thu, 28 Jan 2021 12:52:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-432-qlrzBXiOMrGnAD0BYNkMSA-1;
	Thu, 28 Jan 2021 07:52:30 -0500
X-MC-Unique: qlrzBXiOMrGnAD0BYNkMSA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A92D64DDD;
	Thu, 28 Jan 2021 12:52:28 +0000 (UTC)
Message-ID: <2301cde67ae7aa54d860fc3962aeb8ed85744c75.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 28 Jan 2021 07:52:27 -0500
In-Reply-To: <CAOi1vP-3Ma4LdCcu6sPpwVbmrto5HnOAsJ6r9_973hYY3ODBUQ@mail.gmail.com>
References: <20210126134103.240031-1-jlayton@kernel.org>
	<CAOi1vP-3Ma4LdCcu6sPpwVbmrto5HnOAsJ6r9_973hYY3ODBUQ@mail.gmail.com>
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33)
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10SCqcvP012322
X-loop: linux-cachefs@redhat.com
Cc: LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
	linux-cachefs@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Ceph Development <ceph-devel@vger.kernel.org>
Subject: Re: [Linux-cachefs] [PATCH 0/6] ceph: convert to new netfs read
	helpers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-01-27 at 23:50 +0100, Ilya Dryomov wrote:
> On Tue, Jan 26, 2021 at 2:41 PM Jeff Layton <jlayton@kernel.org> wrote:
> >=20
> > This patchset converts ceph to use the new netfs readpage, write_begin,
> > and readahead helpers to handle buffered reads. This is a substantial
> > reduction in code in ceph, but shouldn't really affect functionality in
> > any way.
> >=20
> > Ilya, if you don't have any objections, I'll plan to let David pull thi=
s
> > series into his tree to be merged with the netfs API patches themselves=
.
>=20
> Sure, that works for me.
>=20
> I would have expected that the new netfs infrastructure is pushed
> to a public branch that individual filesystems could peruse, but since
> David's set already includes patches for AFS and NFS, let's tag along.
>=20
> Thanks,
>=20
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Ilya

David has a fscache-netfs-lib branch that has all of the infrastructure
changes. See:

    https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/l=
og/?h=3Dfscache-netfs-lib

--=20
Jeff Layton <jlayton@kernel.org>


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

