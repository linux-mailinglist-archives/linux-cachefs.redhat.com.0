Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id ACB742C44E9
	for <lists+linux-cachefs@lfdr.de>; Wed, 25 Nov 2020 17:25:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-KyOdwP6uMI6cb8Zuc27RGg-1; Wed, 25 Nov 2020 11:25:38 -0500
X-MC-Unique: KyOdwP6uMI6cb8Zuc27RGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFDCD1E7D8;
	Wed, 25 Nov 2020 16:25:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6408A60BE2;
	Wed, 25 Nov 2020 16:25:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C939A180954D;
	Wed, 25 Nov 2020 16:25:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0APGPSuj005366 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 25 Nov 2020 11:25:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E7E02AB413; Wed, 25 Nov 2020 16:25:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1BD3AB411
	for <linux-cachefs@redhat.com>; Wed, 25 Nov 2020 16:25:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97B52800183
	for <linux-cachefs@redhat.com>; Wed, 25 Nov 2020 16:25:25 +0000 (UTC)
Received: from elasmtp-curtail.atl.sa.earthlink.net
	(elasmtp-curtail.atl.sa.earthlink.net [209.86.89.64]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-515-5-NGK5dEOXyZJokj-h8VmA-1;
	Wed, 25 Nov 2020 11:25:21 -0500
X-MC-Unique: 5-NGK5dEOXyZJokj-h8VmA-1
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws;
	s=dk12062016; d=mindspring.com;
	b=FKVa5HHAFdGr42qI9P8GJ3YGIWEh3YOzaXOX2pJxHaw4jVKiYXHvewCJi/RvKD03Y7ZOqZD7UN+SXjCNExxDNW8gR3CvvwKVaPWk2acOLMhf16h5LuxWr/Aq138Orc8LvJxhixgDtxCjwpi3L9gYWApNF0YHtxIZ5w+E13MWHAK7UfCddNhYqHUvtS+aFcAV69ZXJICmV+E0KqpA0xXAFqdFgxm3wj+ID/DtOVloeu3brn6985NNLYXER/UtQumd3DWGAgmJnM0MDX/mKqqwqdYxEkjU1h9b/4ycRcnLCvRsOArjfE0sUdAU7ZQAz2XnK2RN2kPsWsA7DqcWKomi4g==;
	h=Received:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language:X-ELNK-Trace:X-Originating-IP
Received: from [76.105.143.216] (helo=FRANKSTHINKPAD)
	by elasmtp-curtail.atl.sa.earthlink.net with esmtpa (Exim 4)
	(envelope-from <ffilzlnx@mindspring.com>)
	id 1khxbb-000DVh-Dm; Wed, 25 Nov 2020 11:25:19 -0500
From: "Frank Filz" <ffilzlnx@mindspring.com>
To: "'bfields'" <bfields@fieldses.org>
References: <20200915172140.GA32632@fieldses.org>
	<4d1d7cd0076d98973a56e89c92e4ff0474aa0e14.camel@hammerspace.com>
	<1188023047.38703514.1600272094778.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<0fc201d6c2af$62b039f0$2810add0$@mindspring.com>
	<20201125144753.GC2811@fieldses.org>
In-Reply-To: <20201125144753.GC2811@fieldses.org>
Date: Wed, 25 Nov 2020 08:25:19 -0800
Message-ID: <100101d6c347$917ed0f0$b47c72d0$@mindspring.com>
MIME-Version: 1.0
Thread-Index: AQIMJHTNaUfUC7mKmsL3ACLiQeb3JQI9CmfpAttHNL0B+hIAfgE5qoLXAZr58eYBXdorRQGLCl71AmNKoMYCnwzJbwKcKMdYqMrOhjA=
X-ELNK-Trace: 136157f01908a8929c7f779228e2f6aeda0071232e20db4dce8fa129a7039943542fba0e7dc78578350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 76.105.143.216
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: 'Daire Byrne' <daire@dneg.com>, 'linux-cachefs' <linux-cachefs@redhat.com>,
	'linux-nfs' <linux-nfs@vger.kernel.org>,
	'Trond Myklebust' <trondmy@hammerspace.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-us
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> On Tue, Nov 24, 2020 at 02:15:57PM -0800, Frank Filz wrote:
> > How much conversation about re-export has been had at the wider NFS
> > community level? I have an interest because Ganesha  supports
> > re-export via the PROXY_V3 and PROXY_V4 FSALs. We currently don't have
> > a data cache though there has been discussion of such, we do have
attribute
> and dirent caches.
> >
> > Looking over the wiki page, I have considered being able to specify a
> > re-export of a Ganesha export without encapsulating handles. Ganesha
> > encapsulates the export_fs handle in a way that could be coordinated
> > between the original server and the re-export so they would both
> > effectively have the same encapsulation layer.
> 
> In the case the re-export server only servers a single export, I guess you
could do
> away with the encapsulation.  (The only risk I see is that a client of the
re-export
> server could also access any export of the original server if it could
guess
> filehandles, which might surprise
> admins.)  Maybe that'd be useful.

Ganesha handles have a minor downside that is a help here if Ganesha was
re-exporting another Ganesha server. There is a 16 bit export_id that comes
from the export configuration and is part of the handle. We could easily set
it up so that if the sysadmin configured it as such, each re-exported
Ganesha export would have the same export_id, and then a client handle for
export_id 1 would be mirrored to the original server as export_id 1 and the
two servers can have the same export permissions and everything.

There is some additional stuff we could easily implement in Ganesha to
restrict handle manipulation to sneak around export permissions.

> Another advantage of not encapsulating filehandles is that clients could
more
> easily migrate between servers.

Yea, with the idea I've been mulling for Ganesha, migration between original
server and re-export server would be simple with the same handles. Of course
state migration is a whole different ball of wax, but a clustered setup
could work just as well as Ganesha's clustered filesystems. On the other
hand, re-export with state has a pitfall. If the re-export server crashes,
the state is lost on the original server unless we make a protocol change to
allow state re-export such that a re-export server crashing doesn't cause
state loss. For this reason, I haven't rushed to implement lock state
re-export in Ganesha, rather allowing the re-export server to just manage
lock state locally.

> Cooperating servers could have an agreement on filehandles.  And I guess
we
> could standardize that somehow.  Are we ready for that?  I'm not sure what
> other re-exporting problems there are that I haven't thought of.

I'm not sure how far we want to go there, but potentially specific server
implementations could choose to be interoperable in a way that allows the
handle encapsulation to either be smaller or no extra overhead. For example,
if we implemented what I've thought about for Ganesha-Ganesha re-export,
Ganesha COULD also be "taught" which portion of the knfsd handle is the
filesystem/export identifier, and maintain a database of Ganesha
export/filesystem <-> knfsd export/filesystem and have Ganesha
re-encapsulate the exportfs/name_to_handle_at portion of the handle. Of
course in this case, trivial migration isn't possible since Ganesha will
have a different encapsulation than knfsd.

Incidentally, I also purposefully made Ganesha's encapsulation different so
it never collides with either version of knfsd handles (now if over the
course of the past 10 years another handle version has come along...).

Frank

> --b.
> 
> > I'd love to see some re-export best practices shared among server
> > implementations, and also what we can do to improve things when two
> > server implementations are interoperating via re-export.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

