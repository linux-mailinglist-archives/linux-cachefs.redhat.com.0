Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9BA240D35
	for <lists+linux-cachefs@lfdr.de>; Mon, 10 Aug 2020 20:57:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597085847;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/rQrtPhLkIjSP582ttXyxAxGHtGR5+/YvdvXcTiBMgY=;
	b=Xb9ftIWQTIEUWVkRTrDLKGbnvRxOlSxxcXxscIn9VFjQvpgiBDCQ6VMRMcSLQshrc/rd+e
	A8jPj8WVAo6n/BMFNtmswvxWENhFpy1IyONKn7k2oV3k3SXTUczpHV38Bgn1ciqgQudIms
	M+mEp1Y322/4h+hX6hyEJ+q6ZVNyz5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-jNHKVtF5Ns2ePjs4Z23zpg-1; Mon, 10 Aug 2020 14:57:22 -0400
X-MC-Unique: jNHKVtF5Ns2ePjs4Z23zpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9932D1005510;
	Mon, 10 Aug 2020 18:57:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15A0F8A16F;
	Mon, 10 Aug 2020 18:57:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 219801809554;
	Mon, 10 Aug 2020 18:57:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AItrbR005535 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 14:55:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 586A22166BA0; Mon, 10 Aug 2020 18:55:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 546472166B27
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 18:55:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44A91803880
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 18:55:51 +0000 (UTC)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
	[209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-291--lgcGG_3OjytJRcR5VylKA-1; Mon, 10 Aug 2020 14:55:49 -0400
X-MC-Unique: -lgcGG_3OjytJRcR5VylKA-1
Received: by mail-ej1-f70.google.com with SMTP id q9so4184856ejr.21
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 11:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8w76Vsz8sqy2fap/GPzs/EITXjOm2GkjBqV8wsyiptw=;
	b=UjbUy+/+FNx67dZZz8Z7u3RkmpEkZPEfJEQij1F49/kmQX3/BgHaaxZOVYSX8K6jr6
	rjF6t6HDwpg4O0rJLA9uDGzwM62aocEHbNvEvDBRUgSVRg9s2pY6UG/+fsmY89/X1p3O
	mfsA+DeOhArpfOH/FT3uZQIGDP5+ZlhSJZsteq/F+MEA1+sSjiHwnEgGJscRC5AJIV3i
	xSZHY242jLUbHMEocp/re6BSQXLflcep/gHyYEM0JZg4gjfhgdKyj5DDk1uQDLFrpme+
	kKEFSSUwypkXDjNVjXhwcwLypTe4YqOAqxHlTh4SLvrwGvH8I/rajH+Mns6o9LvkZmvg
	k/Cg==
X-Gm-Message-State: AOAM531tiG8sRDbEO3I7uTejSAV/A6IpK8c2aWviXMREFJFqaR8R4//f
	DzD8K3lNotkwoC0arqWRnXDjaqPkKJOx1QRmdUPpdEydAOfxeFiElEYAS37oYCDJiw5sLda5Le4
	/NQUXgNiQS9QWPGc/eILMc+9nOm5AY9yejrrJbA==
X-Received: by 2002:a17:906:a4b:: with SMTP id
	x11mr24028527ejf.83.1597085747775; 
	Mon, 10 Aug 2020 11:55:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmPgEiJFl+cVO4p6h9RwGpYGushiDcIiZ53mbVILvOEjZU6WkjJFiU4WftR8yieNxMBkcaQVmxvMETG04IOU8=
X-Received: by 2002:a17:906:a4b:: with SMTP id
	x11mr24028507ejf.83.1597085747584; 
	Mon, 10 Aug 2020 11:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200731130421.127022-1-jlayton@kernel.org>
	<20200731130421.127022-10-jlayton@kernel.org>
	<CALF+zOnQ6diJv4bMbf-HSYmHusT_iE1dAqp-j_kjuqyLqfp-nw@mail.gmail.com>
	<526038.1597054155@warthog.procyon.org.uk>
	<CALF+zO=K8iE5y7_5MPS4Zg+stUmY4FQobop1DnsS71Dpn_YpOg@mail.gmail.com>
In-Reply-To: <CALF+zO=K8iE5y7_5MPS4Zg+stUmY4FQobop1DnsS71Dpn_YpOg@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Mon, 10 Aug 2020 14:55:11 -0400
Message-ID: <CALF+zOmZK5uc+JnCtxgxeFY=Xcgm6FN4c+YPKsxoKQy5WpaDng@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: ceph-devel@vger.kernel.org, linux-cachefs@redhat.com,
	Jeff Layton <jlayton@kernel.org>, idryomov@gmail.com
Subject: Re: [Linux-cachefs] [RFC PATCH v2 09/11] ceph: convert readpages to
	fscache_read_helper
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 10, 2020 at 9:50 AM David Wysochanski <dwysocha@redhat.com> wrote:
>
> On Mon, Aug 10, 2020 at 6:09 AM David Howells <dhowells@redhat.com> wrote:
> >
> > David Wysochanski <dwysocha@redhat.com> wrote:
> >
> > > Looks like fscache_shape_request() overrides any 'max_pages' value (actually
> > > it is cachefiles_shape_request) , so it's unclear why the netfs would pass
> > > in a 'max_pages' if it is not honored - seems like a bug maybe or it's not
> > > obvious
> >
> > I think the problem is that cachefiles_shape_request() is applying the limit
> > too early.  It's using it to cut down the number of pages in the original
> > request (only applicable to readpages), but then the shaping to fit cache
> > granules can exceed that, so it needs to be applied later also.
> >
> > Does the attached patch help?
> >
> > David
> > ---
> > diff --git a/fs/cachefiles/content-map.c b/fs/cachefiles/content-map.c
> > index 2bfba2e41c39..ce05cf1d9a6e 100644
> > --- a/fs/cachefiles/content-map.c
> > +++ b/fs/cachefiles/content-map.c
> > @@ -134,7 +134,8 @@ void cachefiles_shape_request(struct fscache_object *obj,
> >         _enter("{%lx,%lx,%x},%llx,%d",
> >                start, end, max_pages, i_size, shape->for_write);
> >
> > -       if (start >= CACHEFILES_SIZE_LIMIT / PAGE_SIZE) {
> > +       if (start >= CACHEFILES_SIZE_LIMIT / PAGE_SIZE ||
> > +           max_pages < CACHEFILES_GRAN_PAGES) {
> >                 shape->to_be_done = FSCACHE_READ_FROM_SERVER;
> >                 return;
> >         }
> > @@ -144,10 +145,6 @@ void cachefiles_shape_request(struct fscache_object *obj,
> >         if (shape->i_size > CACHEFILES_SIZE_LIMIT)
> >                 i_size = CACHEFILES_SIZE_LIMIT;
> >
> > -       max_pages = round_down(max_pages, CACHEFILES_GRAN_PAGES);
> > -       if (end - start > max_pages)
> > -               end = start + max_pages;
> > -
> >         granule = start / CACHEFILES_GRAN_PAGES;
> >         if (granule / 8 >= object->content_map_size) {
> >                 cachefiles_expand_content_map(object, i_size);
> > @@ -185,6 +182,10 @@ void cachefiles_shape_request(struct fscache_object *obj,
> >                 start = round_down(start, CACHEFILES_GRAN_PAGES);
> >                 end   = round_up(end, CACHEFILES_GRAN_PAGES);
> >
> > +               /* Trim to the maximum size the netfs supports */
> > +               if (end - start > max_pages)
> > +                       end = round_down(start + max_pages, CACHEFILES_GRAN_PAGES);
> > +
> >                 /* But trim to the end of the file and the starting page */
> >                 eof = (i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
> >                 if (eof <= shape->proposed_start)
> >
>
> I tried this and got the same panic - I think i_size is the culprit
> (it is larger than max_pages).  I'll send you a larger trace offline
> with cachefiles/fscache debugging enabled if that helps, but below is
> some custom tracing that may be enough because it shows before / after
> shaping values.
>

FWIW, after testing the aforementioned patch, and tracing it,
it is not i_size after all.  I added this small patch on top of the
patch to cachefiles_shape_request() and no more panics.  Though
this may not address the full underlying issues, it at least gets
past this point and max_pages seems to work better.

---
diff --git a/fs/fscache/read_helper.c b/fs/fscache/read_helper.c
index a464c3e3188a..fa67339e7304 100644
--- a/fs/fscache/read_helper.c
+++ b/fs/fscache/read_helper.c
@@ -318,8 +318,8 @@ static int fscache_read_helper(struct
fscache_io_request *req,
        switch (type) {
        case FSCACHE_READ_PAGE_LIST:
                shape.proposed_start = lru_to_page(pages)->index;
-               shape.proposed_nr_pages =
-                       lru_to_last_page(pages)->index -
shape.proposed_start + 1;
+               shape.proposed_nr_pages = min_t(unsigned int, max_pages,
+                       lru_to_last_page(pages)->index -
shape.proposed_start + 1);
                break;

        case FSCACHE_READ_LOCKED_PAGE:

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

